; DESCRIPTION: Renders a red line between points (53, 123) and (79, 41).
; PLAN: r0=53(x1), r1=123(y1), r2=79(x2), r3=41(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 123
LDI r2, 79
LDI r3, 41
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
