; DESCRIPTION: Draws a purple line from (139, 203) to (96, 118).
; PLAN: r0=139(x1), r1=203(y1), r2=96(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 203
LDI r2, 96
LDI r3, 118
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
