; DESCRIPTION: Draws a black circle centered at (286, 94) with radius 62.
; PLAN: r0=286(x), r1=94(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 94
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
