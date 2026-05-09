; DESCRIPTION: Places a orange line segment connecting (58, 113) to (261, 41).
; PLAN: r0=58(x1), r1=113(y1), r2=261(x2), r3=41(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 113
LDI r2, 261
LDI r3, 41
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
