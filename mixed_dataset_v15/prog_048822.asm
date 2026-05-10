; DESCRIPTION: Places a magenta line segment connecting (18, 168) to (459, 151).
; PLAN: r0=18(x1), r1=168(y1), r2=459(x2), r3=151(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 168
LDI r2, 459
LDI r3, 151
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
