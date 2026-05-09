; DESCRIPTION: Places a orange line segment connecting (88, 77) to (102, 25).
; PLAN: r0=88(x1), r1=77(y1), r2=102(x2), r3=25(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 77
LDI r2, 102
LDI r3, 25
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
