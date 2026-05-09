; DESCRIPTION: Places a orange line segment connecting (53, 131) to (78, 37).
; PLAN: r0=53(x1), r1=131(y1), r2=78(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 131
LDI r2, 78
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
