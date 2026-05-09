; DESCRIPTION: Draws a black circle centered at (272, 88) with radius 72.
; PLAN: r0=272(x), r1=88(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 88
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
