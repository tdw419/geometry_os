; DESCRIPTION: Places a purple line segment connecting (211, 201) to (49, 206).
; PLAN: r0=211(x1), r1=201(y1), r2=49(x2), r3=206(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 201
LDI r2, 49
LDI r3, 206
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
