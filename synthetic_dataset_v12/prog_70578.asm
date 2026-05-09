; DESCRIPTION: Draws a black circle centered at (391, 53) with radius 48.
; PLAN: r0=391(x), r1=53(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 53
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
