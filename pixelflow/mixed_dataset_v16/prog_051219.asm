; DESCRIPTION: Renders a magenta line segment connecting (360, 49) to (207, 151).
; PLAN: r0=360(x1), r1=49(y1), r2=207(x2), r3=151(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 49
LDI r2, 207
LDI r3, 151
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
