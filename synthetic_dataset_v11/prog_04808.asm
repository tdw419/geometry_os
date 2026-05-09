; DESCRIPTION: Places a magenta line segment connecting (253, 101) to (70, 105).
; PLAN: r0=253(x1), r1=101(y1), r2=70(x2), r3=105(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 101
LDI r2, 70
LDI r3, 105
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
