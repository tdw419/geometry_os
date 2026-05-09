; DESCRIPTION: Places a orange line segment connecting (161, 101) to (133, 251).
; PLAN: r0=161(x1), r1=101(y1), r2=133(x2), r3=251(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 101
LDI r2, 133
LDI r3, 251
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
