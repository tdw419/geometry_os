; DESCRIPTION: Renders a orange line between points (421, 250) and (123, 110).
; PLAN: r0=421(x1), r1=250(y1), r2=123(x2), r3=110(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 250
LDI r2, 123
LDI r3, 110
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
