; DESCRIPTION: Draws a purple line from (145, 191) to (19, 201).
; PLAN: r0=145(x1), r1=191(y1), r2=19(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 191
LDI r2, 19
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
