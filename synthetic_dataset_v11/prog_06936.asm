; DESCRIPTION: Renders a white line between points (93, 26) and (172, 147).
; PLAN: r0=93(x1), r1=26(y1), r2=172(x2), r3=147(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 26
LDI r2, 172
LDI r3, 147
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
