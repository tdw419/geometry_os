; DESCRIPTION: Places a red line segment connecting (458, 83) to (41, 199).
; PLAN: r0=458(x1), r1=83(y1), r2=41(x2), r3=199(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 83
LDI r2, 41
LDI r3, 199
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
