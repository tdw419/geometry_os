; DESCRIPTION: Places a blue line segment connecting (155, 216) to (160, 78).
; PLAN: r0=155(x1), r1=216(y1), r2=160(x2), r3=78(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 216
LDI r2, 160
LDI r3, 78
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
