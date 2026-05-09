; DESCRIPTION: Places a orange line segment connecting (111, 123) to (494, 163).
; PLAN: r0=111(x1), r1=123(y1), r2=494(x2), r3=163(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 123
LDI r2, 494
LDI r3, 163
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
