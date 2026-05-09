; DESCRIPTION: Places a orange line segment connecting (452, 73) to (88, 26).
; PLAN: r0=452(x1), r1=73(y1), r2=88(x2), r3=26(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 73
LDI r2, 88
LDI r3, 26
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
