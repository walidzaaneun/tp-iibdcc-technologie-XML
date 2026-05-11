<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <h2>Relevé Bancaire RIB: <xsl:value-of select="releve/@RIB"/></h2>
                <table border="1">
                    <tr>
                        <th>Date</th><th>Type</th><th>Montant</th><th>Description</th>
                    </tr>
                    <xsl:for-each select="releve/operations/operation">
                        <tr>
                            <td><xsl:value-of select="@date"/></td>
                            <td><xsl:value-of select="@type"/></td>
                            <td><xsl:value-of select="@montant"/></td>
                            <td><xsl:value-of select="@description"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
                <p>Total Crédit: <xsl:value-of select="sum(releve/operations/operation[@type='CREDIT']/@montant)"/></p>
                <p>Total Débit: <xsl:value-of select="sum(releve/operations/operation[@type='DEBIT']/@montant)"/></p>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>