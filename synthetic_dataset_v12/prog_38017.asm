; DESCRIPTION: Places a orange line segment connecting (261, 50) to (41, 191).
; PLAN: r0=261(x1), r1=50(y1), r2=41(x2), r3=191(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 50
LDI r2, 41
LDI r3, 191
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
