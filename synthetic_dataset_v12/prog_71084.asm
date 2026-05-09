; DESCRIPTION: Draws a black circle centered at (171, 155) with radius 26.
; PLAN: r0=171(x), r1=155(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 155
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
