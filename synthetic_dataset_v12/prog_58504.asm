; DESCRIPTION: Draws a black circle centered at (90, 140) with radius 43.
; PLAN: r0=90(x), r1=140(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 140
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
