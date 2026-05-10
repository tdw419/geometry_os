; DESCRIPTION: Draws a black circle centered at (251, 130) with radius 61.
; PLAN: r0=251(x), r1=130(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 251
LDI r1, 130
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
