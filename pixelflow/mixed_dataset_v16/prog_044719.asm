; DESCRIPTION: Draws a black circle centered at (396, 105) with radius 33.
; PLAN: r0=396(x), r1=105(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 105
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
