; DESCRIPTION: Draws a purple line from (65, 10) to (427, 201).
; PLAN: r0=65(x1), r1=10(y1), r2=427(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 10
LDI r2, 427
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
