; DESCRIPTION: Places a orange line segment connecting (7, 21) to (88, 118).
; PLAN: r0=7(x1), r1=21(y1), r2=88(x2), r3=118(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 21
LDI r2, 88
LDI r3, 118
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
