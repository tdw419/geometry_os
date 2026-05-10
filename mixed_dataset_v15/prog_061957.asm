; DESCRIPTION: Places a magenta line segment connecting (89, 100) to (112, 105).
; PLAN: r0=89(x1), r1=100(y1), r2=112(x2), r3=105(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 100
LDI r2, 112
LDI r3, 105
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
