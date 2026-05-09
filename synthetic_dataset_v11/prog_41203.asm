; DESCRIPTION: Draws a purple line from (8, 201) to (166, 104).
; PLAN: r0=8(x1), r1=201(y1), r2=166(x2), r3=104(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 201
LDI r2, 166
LDI r3, 104
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
