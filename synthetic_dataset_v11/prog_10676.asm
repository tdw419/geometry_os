; DESCRIPTION: Places a orange line segment connecting (155, 43) to (108, 136).
; PLAN: r0=155(x1), r1=43(y1), r2=108(x2), r3=136(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 43
LDI r2, 108
LDI r3, 136
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
