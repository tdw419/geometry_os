; DESCRIPTION: Places a orange line segment connecting (41, 96) to (158, 1).
; PLAN: r0=41(x1), r1=96(y1), r2=158(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 96
LDI r2, 158
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
