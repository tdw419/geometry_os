; DESCRIPTION: Renders a purple line between points (13, 248) and (155, 227).
; PLAN: r0=13(x1), r1=248(y1), r2=155(x2), r3=227(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 248
LDI r2, 155
LDI r3, 227
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
