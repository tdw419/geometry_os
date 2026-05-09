; DESCRIPTION: Renders a orange line between points (120, 66) and (138, 41).
; PLAN: r0=120(x1), r1=66(y1), r2=138(x2), r3=41(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 66
LDI r2, 138
LDI r3, 41
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
