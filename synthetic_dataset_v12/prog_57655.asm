; DESCRIPTION: Renders a orange line between points (137, 114) and (421, 5).
; PLAN: r0=137(x1), r1=114(y1), r2=421(x2), r3=5(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 114
LDI r2, 421
LDI r3, 5
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
