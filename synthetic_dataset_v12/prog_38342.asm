; DESCRIPTION: Renders a orange line between points (234, 136) and (36, 59).
; PLAN: r0=234(x1), r1=136(y1), r2=36(x2), r3=59(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 136
LDI r2, 36
LDI r3, 59
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
