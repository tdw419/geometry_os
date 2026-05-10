; DESCRIPTION: Draws a purple line from (97, 0) to (53, 88).
; PLAN: r0=97(x1), r1=0(y1), r2=53(x2), r3=88(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 0
LDI r2, 53
LDI r3, 88
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
