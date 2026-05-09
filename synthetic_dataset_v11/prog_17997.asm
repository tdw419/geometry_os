; DESCRIPTION: Places a orange line segment connecting (100, 118) to (158, 223).
; PLAN: r0=100(x1), r1=118(y1), r2=158(x2), r3=223(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 118
LDI r2, 158
LDI r3, 223
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
