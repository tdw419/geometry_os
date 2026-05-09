; DESCRIPTION: Draws a black circle centered at (65, 171) with radius 33.
; PLAN: r0=65(x), r1=171(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 171
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
