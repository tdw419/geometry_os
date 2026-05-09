; DESCRIPTION: Renders a red line between points (177, 61) and (438, 130).
; PLAN: r0=177(x1), r1=61(y1), r2=438(x2), r3=130(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 61
LDI r2, 438
LDI r3, 130
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
