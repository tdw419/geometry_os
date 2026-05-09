; DESCRIPTION: Renders a orange line between points (81, 218) and (115, 155).
; PLAN: r0=81(x1), r1=218(y1), r2=115(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 218
LDI r2, 115
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
