; DESCRIPTION: Draws a black circle centered at (47, 140) with radius 39.
; PLAN: r0=47(x), r1=140(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 47
LDI r1, 140
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
