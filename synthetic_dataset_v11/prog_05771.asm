; DESCRIPTION: Draws a black circle centered at (44, 165) with radius 20.
; PLAN: r0=44(x), r1=165(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 165
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
