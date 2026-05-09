; DESCRIPTION: Places a red line segment connecting (444, 93) to (41, 30).
; PLAN: r0=444(x1), r1=93(y1), r2=41(x2), r3=30(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 93
LDI r2, 41
LDI r3, 30
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
