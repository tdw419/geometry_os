; DESCRIPTION: Places a purple line segment connecting (204, 153) to (201, 83).
; PLAN: r0=204(x1), r1=153(y1), r2=201(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 153
LDI r2, 201
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
