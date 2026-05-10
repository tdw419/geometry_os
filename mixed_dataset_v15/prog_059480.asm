; DESCRIPTION: Places a orange line segment connecting (250, 54) to (390, 118).
; PLAN: r0=250(x1), r1=54(y1), r2=390(x2), r3=118(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 54
LDI r2, 390
LDI r3, 118
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
