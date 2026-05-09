; DESCRIPTION: Draws a blue circle centered at (397, 72) with radius 53.
; PLAN: r0=397(x), r1=72(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 72
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
