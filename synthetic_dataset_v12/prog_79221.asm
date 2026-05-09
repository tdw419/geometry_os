; DESCRIPTION: Renders a blue line between points (402, 119) and (501, 81).
; PLAN: r0=402(x1), r1=119(y1), r2=501(x2), r3=81(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 119
LDI r2, 501
LDI r3, 81
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
