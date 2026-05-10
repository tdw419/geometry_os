; DESCRIPTION: Renders a purple line between points (336, 11) and (366, 136).
; PLAN: r0=336(x1), r1=11(y1), r2=366(x2), r3=136(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 11
LDI r2, 366
LDI r3, 136
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
