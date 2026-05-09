; DESCRIPTION: Places a purple line segment connecting (52, 21) to (14, 201).
; PLAN: r0=52(x1), r1=21(y1), r2=14(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 21
LDI r2, 14
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
