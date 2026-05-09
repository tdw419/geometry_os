; DESCRIPTION: Renders a orange line between points (89, 105) and (375, 209).
; PLAN: r0=89(x1), r1=105(y1), r2=375(x2), r3=209(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 105
LDI r2, 375
LDI r3, 209
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
