; DESCRIPTION: Renders a orange line between points (41, 237) and (50, 54).
; PLAN: r0=41(x1), r1=237(y1), r2=50(x2), r3=54(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 237
LDI r2, 50
LDI r3, 54
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
