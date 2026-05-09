; DESCRIPTION: Places a yellow line segment connecting (52, 100) to (96, 106).
; PLAN: r0=52(x1), r1=100(y1), r2=96(x2), r3=106(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 100
LDI r2, 96
LDI r3, 106
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
