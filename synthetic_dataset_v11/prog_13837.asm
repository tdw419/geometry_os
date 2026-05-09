; DESCRIPTION: Renders a orange line between points (222, 37) and (184, 217).
; PLAN: r0=222(x1), r1=37(y1), r2=184(x2), r3=217(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 37
LDI r2, 184
LDI r3, 217
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
