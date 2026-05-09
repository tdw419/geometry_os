; DESCRIPTION: Draws a orange circle centered at (62, 67) with radius 39.
; PLAN: r0=62(x), r1=67(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 67
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
