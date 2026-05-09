; DESCRIPTION: Renders a orange line between points (95, 167) and (24, 41).
; PLAN: r0=95(x1), r1=167(y1), r2=24(x2), r3=41(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 167
LDI r2, 24
LDI r3, 41
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
