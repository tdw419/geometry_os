; DESCRIPTION: Draws a purple line from (477, 217) to (255, 151).
; PLAN: r0=477(x1), r1=217(y1), r2=255(x2), r3=151(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 217
LDI r2, 255
LDI r3, 151
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
