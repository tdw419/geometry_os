; DESCRIPTION: Places a purple line segment connecting (287, 252) to (379, 201).
; PLAN: r0=287(x1), r1=252(y1), r2=379(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 252
LDI r2, 379
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
