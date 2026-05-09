; DESCRIPTION: Places a orange line segment connecting (223, 162) to (34, 90).
; PLAN: r0=223(x1), r1=162(y1), r2=34(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 162
LDI r2, 34
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
