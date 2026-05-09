; DESCRIPTION: Renders a orange line between points (232, 147) and (108, 3).
; PLAN: r0=232(x1), r1=147(y1), r2=108(x2), r3=3(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 147
LDI r2, 108
LDI r3, 3
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
