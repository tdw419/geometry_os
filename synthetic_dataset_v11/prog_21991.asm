; DESCRIPTION: Places a red line segment connecting (125, 11) to (41, 96).
; PLAN: r0=125(x1), r1=11(y1), r2=41(x2), r3=96(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 11
LDI r2, 41
LDI r3, 96
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
