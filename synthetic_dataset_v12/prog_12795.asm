; DESCRIPTION: Draws a black circle centered at (299, 115) with radius 19.
; PLAN: r0=299(x), r1=115(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 299
LDI r1, 115
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
