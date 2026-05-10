; DESCRIPTION: Renders a magenta line segment connecting (187, 15) to (94, 151).
; PLAN: r0=187(x1), r1=15(y1), r2=94(x2), r3=151(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 15
LDI r2, 94
LDI r3, 151
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
