; DESCRIPTION: Draws a black circle centered at (347, 141) with radius 12.
; PLAN: r0=347(x), r1=141(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 141
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
