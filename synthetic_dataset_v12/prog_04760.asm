; DESCRIPTION: Places a magenta line segment connecting (22, 194) to (129, 25).
; PLAN: r0=22(x1), r1=194(y1), r2=129(x2), r3=25(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 194
LDI r2, 129
LDI r3, 25
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
