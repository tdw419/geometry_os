; DESCRIPTION: Draws a orange circle centered at (67, 170) with radius 53.
; PLAN: r0=67(x), r1=170(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 170
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
