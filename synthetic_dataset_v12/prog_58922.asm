; DESCRIPTION: Renders a orange line between points (163, 25) and (234, 116).
; PLAN: r0=163(x1), r1=25(y1), r2=234(x2), r3=116(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 25
LDI r2, 234
LDI r3, 116
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
