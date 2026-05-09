; DESCRIPTION: Draws a purple line from (169, 201) to (0, 30).
; PLAN: r0=169(x1), r1=201(y1), r2=0(x2), r3=30(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 201
LDI r2, 0
LDI r3, 30
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
