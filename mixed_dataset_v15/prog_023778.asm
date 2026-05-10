; DESCRIPTION: Draws a black circle centered at (128, 148) with radius 73.
; PLAN: r0=128(x), r1=148(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 148
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
