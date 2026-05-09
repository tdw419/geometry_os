; DESCRIPTION: Places a purple line segment connecting (20, 155) to (196, 56).
; PLAN: r0=20(x1), r1=155(y1), r2=196(x2), r3=56(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 155
LDI r2, 196
LDI r3, 56
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
