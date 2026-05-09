; DESCRIPTION: Places a purple line segment connecting (27, 179) to (381, 20).
; PLAN: r0=27(x1), r1=179(y1), r2=381(x2), r3=20(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 179
LDI r2, 381
LDI r3, 20
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
