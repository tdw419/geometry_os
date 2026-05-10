; DESCRIPTION: Places a purple line segment connecting (154, 94) to (149, 151).
; PLAN: r0=154(x1), r1=94(y1), r2=149(x2), r3=151(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 94
LDI r2, 149
LDI r3, 151
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
