; DESCRIPTION: Renders a orange line between points (252, 199) and (2, 58).
; PLAN: r0=252(x1), r1=199(y1), r2=2(x2), r3=58(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 199
LDI r2, 2
LDI r3, 58
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
