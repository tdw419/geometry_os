; DESCRIPTION: Renders a purple line between points (261, 34) and (155, 8).
; PLAN: r0=261(x1), r1=34(y1), r2=155(x2), r3=8(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 34
LDI r2, 155
LDI r3, 8
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
