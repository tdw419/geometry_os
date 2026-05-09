; DESCRIPTION: Places a purple line segment connecting (221, 251) to (154, 151).
; PLAN: r0=221(x1), r1=251(y1), r2=154(x2), r3=151(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 251
LDI r2, 154
LDI r3, 151
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
