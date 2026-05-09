; DESCRIPTION: Draws a black circle centered at (286, 36) with radius 18.
; PLAN: r0=286(x), r1=36(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 36
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
