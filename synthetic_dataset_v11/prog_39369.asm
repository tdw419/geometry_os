; DESCRIPTION: Places a magenta line segment connecting (44, 142) to (162, 151).
; PLAN: r0=44(x1), r1=142(y1), r2=162(x2), r3=151(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 142
LDI r2, 162
LDI r3, 151
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
