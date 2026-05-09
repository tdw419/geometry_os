; DESCRIPTION: Draws a black circle centered at (164, 164) with radius 23.
; PLAN: r0=164(x), r1=164(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 164
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
