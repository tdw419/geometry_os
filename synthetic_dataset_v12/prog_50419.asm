; DESCRIPTION: Draws a purple line from (201, 179) to (372, 217).
; PLAN: r0=201(x1), r1=179(y1), r2=372(x2), r3=217(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 179
LDI r2, 372
LDI r3, 217
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
