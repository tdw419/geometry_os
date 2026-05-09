; DESCRIPTION: Draws a black circle centered at (131, 165) with radius 43.
; PLAN: r0=131(x), r1=165(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 165
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
