; DESCRIPTION: Places a yellow line segment connecting (357, 2) to (390, 23).
; PLAN: r0=357(x1), r1=2(y1), r2=390(x2), r3=23(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 2
LDI r2, 390
LDI r3, 23
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
