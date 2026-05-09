; DESCRIPTION: Places a blue line segment connecting (124, 219) to (155, 220).
; PLAN: r0=124(x1), r1=219(y1), r2=155(x2), r3=220(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 219
LDI r2, 155
LDI r3, 220
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
