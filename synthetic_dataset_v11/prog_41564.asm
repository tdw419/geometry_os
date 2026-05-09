; DESCRIPTION: Places a orange line segment connecting (76, 35) to (116, 56).
; PLAN: r0=76(x1), r1=35(y1), r2=116(x2), r3=56(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 35
LDI r2, 116
LDI r3, 56
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
