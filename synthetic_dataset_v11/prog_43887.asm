; DESCRIPTION: Places a red line segment connecting (65, 41) to (232, 66).
; PLAN: r0=65(x1), r1=41(y1), r2=232(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 41
LDI r2, 232
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
