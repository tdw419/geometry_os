; DESCRIPTION: Renders a orange line between points (47, 225) and (170, 148).
; PLAN: r0=47(x1), r1=225(y1), r2=170(x2), r3=148(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 225
LDI r2, 170
LDI r3, 148
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
