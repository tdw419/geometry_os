; DESCRIPTION: Draws a purple line from (78, 101) to (105, 205).
; PLAN: r0=78(x1), r1=101(y1), r2=105(x2), r3=205(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 101
LDI r2, 105
LDI r3, 205
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
