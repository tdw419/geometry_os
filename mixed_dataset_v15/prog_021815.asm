; DESCRIPTION: Draws a purple line from (107, 139) to (377, 151).
; PLAN: r0=107(x1), r1=139(y1), r2=377(x2), r3=151(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 139
LDI r2, 377
LDI r3, 151
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
