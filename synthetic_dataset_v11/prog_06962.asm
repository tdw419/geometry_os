; DESCRIPTION: Renders a purple line between points (49, 96) and (190, 151).
; PLAN: r0=49(x1), r1=96(y1), r2=190(x2), r3=151(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 96
LDI r2, 190
LDI r3, 151
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
