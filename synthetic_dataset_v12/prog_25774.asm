; DESCRIPTION: Places a yellow line segment connecting (100, 1) to (357, 66).
; PLAN: r0=100(x1), r1=1(y1), r2=357(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 1
LDI r2, 357
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
