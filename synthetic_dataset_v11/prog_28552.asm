; DESCRIPTION: Places a magenta line segment connecting (129, 101) to (247, 97).
; PLAN: r0=129(x1), r1=101(y1), r2=247(x2), r3=97(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 101
LDI r2, 247
LDI r3, 97
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
