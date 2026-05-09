; DESCRIPTION: Places a orange line segment connecting (486, 251) to (88, 79).
; PLAN: r0=486(x1), r1=251(y1), r2=88(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 251
LDI r2, 88
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
