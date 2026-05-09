; DESCRIPTION: Renders a red line between points (31, 15) and (11, 41).
; PLAN: r0=31(x1), r1=15(y1), r2=11(x2), r3=41(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 15
LDI r2, 11
LDI r3, 41
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
