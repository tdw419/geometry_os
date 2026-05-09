; DESCRIPTION: Draws a black circle centered at (164, 111) with radius 55.
; PLAN: r0=164(x), r1=111(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 111
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
