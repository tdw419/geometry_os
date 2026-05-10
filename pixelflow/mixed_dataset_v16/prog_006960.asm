; DESCRIPTION: Renders a red line between points (41, 15) and (100, 229).
; PLAN: r0=41(x1), r1=15(y1), r2=100(x2), r3=229(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 15
LDI r2, 100
LDI r3, 229
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
