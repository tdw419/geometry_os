; DESCRIPTION: Places a orange line segment connecting (0, 118) to (145, 25).
; PLAN: r0=0(x1), r1=118(y1), r2=145(x2), r3=25(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 118
LDI r2, 145
LDI r3, 25
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
