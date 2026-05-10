; DESCRIPTION: Places a purple line segment connecting (348, 60) to (201, 221).
; PLAN: r0=348(x1), r1=60(y1), r2=201(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 60
LDI r2, 201
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
