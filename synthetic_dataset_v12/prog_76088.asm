; DESCRIPTION: Renders a orange line between points (462, 50) and (129, 52).
; PLAN: r0=462(x1), r1=50(y1), r2=129(x2), r3=52(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 50
LDI r2, 129
LDI r3, 52
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
