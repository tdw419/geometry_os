; DESCRIPTION: Places a orange line segment connecting (41, 176) to (267, 31).
; PLAN: r0=41(x1), r1=176(y1), r2=267(x2), r3=31(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 176
LDI r2, 267
LDI r3, 31
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
