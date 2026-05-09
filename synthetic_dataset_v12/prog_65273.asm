; DESCRIPTION: Draws a purple line from (37, 122) to (343, 49).
; PLAN: r0=37(x1), r1=122(y1), r2=343(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 122
LDI r2, 343
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
