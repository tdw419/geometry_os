; DESCRIPTION: Renders a orange line between points (170, 35) and (184, 0).
; PLAN: r0=170(x1), r1=35(y1), r2=184(x2), r3=0(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 35
LDI r2, 184
LDI r3, 0
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
