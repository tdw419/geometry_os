; DESCRIPTION: Draws a black circle centered at (219, 139) with radius 24.
; PLAN: r0=219(x), r1=139(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 139
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
