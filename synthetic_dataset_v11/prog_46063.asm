; DESCRIPTION: Renders a purple line between points (234, 110) and (155, 26).
; PLAN: r0=234(x1), r1=110(y1), r2=155(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 110
LDI r2, 155
LDI r3, 26
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
