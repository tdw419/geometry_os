; DESCRIPTION: Renders a green line between points (438, 211) and (172, 176).
; PLAN: r0=438(x1), r1=211(y1), r2=172(x2), r3=176(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 211
LDI r2, 172
LDI r3, 176
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
