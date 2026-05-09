; DESCRIPTION: Draws a purple line from (203, 160) to (201, 194).
; PLAN: r0=203(x1), r1=160(y1), r2=201(x2), r3=194(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 160
LDI r2, 201
LDI r3, 194
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
