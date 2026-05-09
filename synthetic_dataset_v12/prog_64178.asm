; DESCRIPTION: Places a orange line segment connecting (452, 24) to (105, 59).
; PLAN: r0=452(x1), r1=24(y1), r2=105(x2), r3=59(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 24
LDI r2, 105
LDI r3, 59
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
