; DESCRIPTION: Renders a orange line between points (122, 136) and (99, 162).
; PLAN: r0=122(x1), r1=136(y1), r2=99(x2), r3=162(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 136
LDI r2, 99
LDI r3, 162
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
