; DESCRIPTION: Draws a orange circle centered at (67, 98) with radius 60.
; PLAN: r0=67(x), r1=98(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 98
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
