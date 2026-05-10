; DESCRIPTION: Draws a purple line from (101, 105) to (83, 183).
; PLAN: r0=101(x1), r1=105(y1), r2=83(x2), r3=183(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 105
LDI r2, 83
LDI r3, 183
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
