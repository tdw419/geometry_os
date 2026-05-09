; DESCRIPTION: Places a purple line segment connecting (457, 90) to (383, 190).
; PLAN: r0=457(x1), r1=90(y1), r2=383(x2), r3=190(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 90
LDI r2, 383
LDI r3, 190
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
