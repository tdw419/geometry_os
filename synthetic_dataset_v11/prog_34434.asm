; DESCRIPTION: Places a orange line segment connecting (88, 183) to (252, 79).
; PLAN: r0=88(x1), r1=183(y1), r2=252(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 183
LDI r2, 252
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
