; DESCRIPTION: Renders a orange line between points (188, 53) and (62, 81).
; PLAN: r0=188(x1), r1=53(y1), r2=62(x2), r3=81(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 53
LDI r2, 62
LDI r3, 81
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
