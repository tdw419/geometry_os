; DESCRIPTION: Places a green line segment connecting (490, 56) to (390, 155).
; PLAN: r0=490(x1), r1=56(y1), r2=390(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 56
LDI r2, 390
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
