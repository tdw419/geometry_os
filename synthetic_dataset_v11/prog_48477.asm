; DESCRIPTION: Renders a orange line between points (163, 12) and (161, 114).
; PLAN: r0=163(x1), r1=12(y1), r2=161(x2), r3=114(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 12
LDI r2, 161
LDI r3, 114
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
