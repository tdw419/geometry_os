; DESCRIPTION: Renders a orange line between points (216, 41) and (69, 85).
; PLAN: r0=216(x1), r1=41(y1), r2=69(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 41
LDI r2, 69
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
