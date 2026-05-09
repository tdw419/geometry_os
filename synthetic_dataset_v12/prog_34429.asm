; DESCRIPTION: Places a orange line segment connecting (477, 186) to (262, 41).
; PLAN: r0=477(x1), r1=186(y1), r2=262(x2), r3=41(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 186
LDI r2, 262
LDI r3, 41
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
