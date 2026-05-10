; DESCRIPTION: Draws a purple line from (282, 200) to (201, 158).
; PLAN: r0=282(x1), r1=200(y1), r2=201(x2), r3=158(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 200
LDI r2, 201
LDI r3, 158
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
