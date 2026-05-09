; DESCRIPTION: Places a magenta line segment connecting (426, 24) to (495, 118).
; PLAN: r0=426(x1), r1=24(y1), r2=495(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 24
LDI r2, 495
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
