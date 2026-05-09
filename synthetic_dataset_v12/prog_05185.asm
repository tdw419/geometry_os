; DESCRIPTION: Places a orange line segment connecting (333, 15) to (334, 89).
; PLAN: r0=333(x1), r1=15(y1), r2=334(x2), r3=89(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 15
LDI r2, 334
LDI r3, 89
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
