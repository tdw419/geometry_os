; DESCRIPTION: Places a orange line segment connecting (129, 46) to (62, 35).
; PLAN: r0=129(x1), r1=46(y1), r2=62(x2), r3=35(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 46
LDI r2, 62
LDI r3, 35
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
