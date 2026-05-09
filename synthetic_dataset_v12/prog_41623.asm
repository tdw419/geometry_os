; DESCRIPTION: Renders a orange line between points (159, 232) and (41, 50).
; PLAN: r0=159(x1), r1=232(y1), r2=41(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 232
LDI r2, 41
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
