; DESCRIPTION: Places a orange line segment connecting (357, 85) to (93, 121).
; PLAN: r0=357(x1), r1=85(y1), r2=93(x2), r3=121(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 85
LDI r2, 93
LDI r3, 121
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
