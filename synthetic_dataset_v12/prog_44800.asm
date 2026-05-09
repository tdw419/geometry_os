; DESCRIPTION: Places a purple line segment connecting (51, 201) to (128, 7).
; PLAN: r0=51(x1), r1=201(y1), r2=128(x2), r3=7(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 201
LDI r2, 128
LDI r3, 7
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
