; DESCRIPTION: Draws a black circle centered at (364, 64) with radius 13.
; PLAN: r0=364(x), r1=64(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 64
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
