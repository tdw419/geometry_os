; DESCRIPTION: Renders a orange line between points (182, 232) and (184, 84).
; PLAN: r0=182(x1), r1=232(y1), r2=184(x2), r3=84(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 232
LDI r2, 184
LDI r3, 84
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
