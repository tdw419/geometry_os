; DESCRIPTION: Renders a orange line between points (245, 207) and (41, 153).
; PLAN: r0=245(x1), r1=207(y1), r2=41(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 207
LDI r2, 41
LDI r3, 153
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
