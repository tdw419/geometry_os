; DESCRIPTION: Draws a black circle centered at (462, 224) with radius 28.
; PLAN: r0=462(x), r1=224(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 462
LDI r1, 224
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
