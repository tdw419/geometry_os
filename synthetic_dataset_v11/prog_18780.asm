; DESCRIPTION: Places a orange line segment connecting (141, 170) to (129, 85).
; PLAN: r0=141(x1), r1=170(y1), r2=129(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 170
LDI r2, 129
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
