; DESCRIPTION: Draws a black circle centered at (82, 238) with radius 14.
; PLAN: r0=82(x), r1=238(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 238
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
