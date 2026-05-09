; DESCRIPTION: Places a orange line segment connecting (36, 92) to (207, 100).
; PLAN: r0=36(x1), r1=92(y1), r2=207(x2), r3=100(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 92
LDI r2, 207
LDI r3, 100
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
