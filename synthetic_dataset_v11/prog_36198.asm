; DESCRIPTION: Places a orange line segment connecting (99, 5) to (15, 89).
; PLAN: r0=99(x1), r1=5(y1), r2=15(x2), r3=89(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 5
LDI r2, 15
LDI r3, 89
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
