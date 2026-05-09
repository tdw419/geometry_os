; DESCRIPTION: Places a magenta line segment connecting (158, 219) to (153, 114).
; PLAN: r0=158(x1), r1=219(y1), r2=153(x2), r3=114(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 219
LDI r2, 153
LDI r3, 114
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
