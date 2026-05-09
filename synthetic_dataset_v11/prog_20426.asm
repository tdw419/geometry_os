; DESCRIPTION: Draws a orange circle centered at (158, 192) with radius 59.
; PLAN: r0=158(x), r1=192(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 192
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
