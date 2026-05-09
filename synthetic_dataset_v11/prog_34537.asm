; DESCRIPTION: Places a orange line segment connecting (41, 225) to (116, 161).
; PLAN: r0=41(x1), r1=225(y1), r2=116(x2), r3=161(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 225
LDI r2, 116
LDI r3, 161
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
