; DESCRIPTION: Places a yellow line segment connecting (75, 162) to (237, 151).
; PLAN: r0=75(x1), r1=162(y1), r2=237(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 162
LDI r2, 237
LDI r3, 151
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
