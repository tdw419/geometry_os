; DESCRIPTION: Draws a black circle centered at (215, 111) with radius 33.
; PLAN: r0=215(x), r1=111(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 111
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
