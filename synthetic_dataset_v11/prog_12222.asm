; DESCRIPTION: Places a orange line segment connecting (31, 10) to (99, 85).
; PLAN: r0=31(x1), r1=10(y1), r2=99(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 10
LDI r2, 99
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
