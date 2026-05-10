; DESCRIPTION: Places a orange line segment connecting (93, 41) to (430, 49).
; PLAN: r0=93(x1), r1=41(y1), r2=430(x2), r3=49(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 41
LDI r2, 430
LDI r3, 49
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
