; DESCRIPTION: Places a orange line segment connecting (134, 160) to (129, 53).
; PLAN: r0=134(x1), r1=160(y1), r2=129(x2), r3=53(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 160
LDI r2, 129
LDI r3, 53
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
