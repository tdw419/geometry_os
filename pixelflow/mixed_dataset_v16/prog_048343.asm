; DESCRIPTION: Places a orange line segment connecting (451, 43) to (111, 153).
; PLAN: r0=451(x1), r1=43(y1), r2=111(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 43
LDI r2, 111
LDI r3, 153
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
