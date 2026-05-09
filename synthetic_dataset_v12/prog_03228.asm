; DESCRIPTION: Draws a black circle centered at (447, 161) with radius 39.
; PLAN: r0=447(x), r1=161(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 447
LDI r1, 161
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
