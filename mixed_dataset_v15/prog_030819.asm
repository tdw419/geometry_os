; DESCRIPTION: Draws a black circle centered at (421, 67) with radius 34.
; PLAN: r0=421(x), r1=67(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 67
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
