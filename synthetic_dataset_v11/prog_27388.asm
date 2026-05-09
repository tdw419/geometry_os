; DESCRIPTION: Draws a purple line from (105, 27) to (1, 201).
; PLAN: r0=105(x1), r1=27(y1), r2=1(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 27
LDI r2, 1
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
