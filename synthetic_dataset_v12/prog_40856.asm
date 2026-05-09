; DESCRIPTION: Places a red line segment connecting (396, 41) to (30, 73).
; PLAN: r0=396(x1), r1=41(y1), r2=30(x2), r3=73(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 41
LDI r2, 30
LDI r3, 73
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
