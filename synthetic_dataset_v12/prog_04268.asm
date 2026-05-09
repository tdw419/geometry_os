; DESCRIPTION: Draws a black circle centered at (265, 140) with radius 75.
; PLAN: r0=265(x), r1=140(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 265
LDI r1, 140
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
