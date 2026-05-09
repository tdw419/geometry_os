; DESCRIPTION: Places a yellow line segment connecting (105, 156) to (132, 110).
; PLAN: r0=105(x1), r1=156(y1), r2=132(x2), r3=110(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 156
LDI r2, 132
LDI r3, 110
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
