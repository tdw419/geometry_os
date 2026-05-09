; DESCRIPTION: Renders a purple line between points (194, 26) and (302, 90).
; PLAN: r0=194(x1), r1=26(y1), r2=302(x2), r3=90(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 26
LDI r2, 302
LDI r3, 90
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
