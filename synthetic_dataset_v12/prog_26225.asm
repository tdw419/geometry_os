; DESCRIPTION: Places a black line segment connecting (458, 158) to (68, 41).
; PLAN: r0=458(x1), r1=158(y1), r2=68(x2), r3=41(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 158
LDI r2, 68
LDI r3, 41
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
