; DESCRIPTION: Renders a orange line between points (184, 75) and (233, 15).
; PLAN: r0=184(x1), r1=75(y1), r2=233(x2), r3=15(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 75
LDI r2, 233
LDI r3, 15
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
