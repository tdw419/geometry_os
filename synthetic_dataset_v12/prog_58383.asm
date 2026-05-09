; DESCRIPTION: Draws a black circle centered at (385, 92) with radius 17.
; PLAN: r0=385(x), r1=92(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 92
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
