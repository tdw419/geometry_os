; DESCRIPTION: Renders a purple line between points (62, 15) and (381, 121).
; PLAN: r0=62(x1), r1=15(y1), r2=381(x2), r3=121(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 15
LDI r2, 381
LDI r3, 121
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
