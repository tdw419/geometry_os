; DESCRIPTION: Draws a black circle centered at (177, 171) with radius 43.
; PLAN: r0=177(x), r1=171(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 171
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
