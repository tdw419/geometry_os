; DESCRIPTION: Places a purple line segment connecting (135, 201) to (3, 105).
; PLAN: r0=135(x1), r1=201(y1), r2=3(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 201
LDI r2, 3
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
