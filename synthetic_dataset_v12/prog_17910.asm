; DESCRIPTION: Places a orange line segment connecting (215, 41) to (286, 131).
; PLAN: r0=215(x1), r1=41(y1), r2=286(x2), r3=131(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 41
LDI r2, 286
LDI r3, 131
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
