; DESCRIPTION: Places a orange line segment connecting (240, 28) to (41, 24).
; PLAN: r0=240(x1), r1=28(y1), r2=41(x2), r3=24(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 28
LDI r2, 41
LDI r3, 24
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
