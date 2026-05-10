; DESCRIPTION: Places a orange line segment connecting (168, 99) to (41, 49).
; PLAN: r0=168(x1), r1=99(y1), r2=41(x2), r3=49(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 99
LDI r2, 41
LDI r3, 49
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
