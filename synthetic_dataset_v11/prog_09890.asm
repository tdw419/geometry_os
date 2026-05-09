; DESCRIPTION: Draws a purple line from (40, 153) to (203, 105).
; PLAN: r0=40(x1), r1=153(y1), r2=203(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 153
LDI r2, 203
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
