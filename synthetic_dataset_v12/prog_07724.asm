; DESCRIPTION: Places a orange line segment connecting (4, 94) to (34, 100).
; PLAN: r0=4(x1), r1=94(y1), r2=34(x2), r3=100(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 94
LDI r2, 34
LDI r3, 100
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
