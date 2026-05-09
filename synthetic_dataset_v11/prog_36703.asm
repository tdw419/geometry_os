; DESCRIPTION: Draws a purple line from (201, 58) to (12, 194).
; PLAN: r0=201(x1), r1=58(y1), r2=12(x2), r3=194(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 58
LDI r2, 12
LDI r3, 194
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
