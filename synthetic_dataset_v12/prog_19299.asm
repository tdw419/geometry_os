; DESCRIPTION: Draws a black circle centered at (204, 171) with radius 47.
; PLAN: r0=204(x), r1=171(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 171
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
