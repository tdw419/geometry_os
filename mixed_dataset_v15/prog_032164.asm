; DESCRIPTION: Draws a black circle centered at (275, 130) with radius 17.
; PLAN: r0=275(x), r1=130(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 130
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
