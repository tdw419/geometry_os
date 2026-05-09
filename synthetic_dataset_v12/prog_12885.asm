; DESCRIPTION: Draws a black circle centered at (259, 86) with radius 66.
; PLAN: r0=259(x), r1=86(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 86
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
