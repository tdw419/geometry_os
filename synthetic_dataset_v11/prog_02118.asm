; DESCRIPTION: Renders a orange line between points (7, 199) and (55, 254).
; PLAN: r0=7(x1), r1=199(y1), r2=55(x2), r3=254(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 199
LDI r2, 55
LDI r3, 254
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
