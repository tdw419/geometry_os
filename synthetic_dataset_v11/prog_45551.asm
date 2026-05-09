; DESCRIPTION: Draws a black circle centered at (67, 189) with radius 28.
; PLAN: r0=67(x), r1=189(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 189
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
