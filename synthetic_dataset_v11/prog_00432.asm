; DESCRIPTION: Renders a orange line between points (49, 21) and (129, 3).
; PLAN: r0=49(x1), r1=21(y1), r2=129(x2), r3=3(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 21
LDI r2, 129
LDI r3, 3
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
