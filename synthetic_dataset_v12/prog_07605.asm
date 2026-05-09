; DESCRIPTION: Renders a orange line between points (59, 218) and (454, 155).
; PLAN: r0=59(x1), r1=218(y1), r2=454(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 218
LDI r2, 454
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
