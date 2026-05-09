; DESCRIPTION: Renders a orange line between points (375, 12) and (55, 3).
; PLAN: r0=375(x1), r1=12(y1), r2=55(x2), r3=3(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 12
LDI r2, 55
LDI r3, 3
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
