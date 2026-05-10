; DESCRIPTION: Draws a blue circle centered at (397, 139) with radius 14.
; PLAN: r0=397(x), r1=139(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 139
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
