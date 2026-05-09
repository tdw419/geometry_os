; DESCRIPTION: Renders a orange line between points (75, 6) and (41, 229).
; PLAN: r0=75(x1), r1=6(y1), r2=41(x2), r3=229(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 6
LDI r2, 41
LDI r3, 229
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
