; DESCRIPTION: Renders a orange line between points (43, 84) and (115, 116).
; PLAN: r0=43(x1), r1=84(y1), r2=115(x2), r3=116(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 84
LDI r2, 115
LDI r3, 116
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
