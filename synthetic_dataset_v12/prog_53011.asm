; DESCRIPTION: Draws a black circle centered at (203, 123) with radius 32.
; PLAN: r0=203(x), r1=123(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 123
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
