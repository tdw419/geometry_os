; DESCRIPTION: Renders a orange line between points (185, 41) and (3, 43).
; PLAN: r0=185(x1), r1=41(y1), r2=3(x2), r3=43(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 41
LDI r2, 3
LDI r3, 43
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
