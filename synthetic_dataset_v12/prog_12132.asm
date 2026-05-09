; DESCRIPTION: Renders a purple line between points (302, 185) and (276, 100).
; PLAN: r0=302(x1), r1=185(y1), r2=276(x2), r3=100(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 185
LDI r2, 276
LDI r3, 100
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
