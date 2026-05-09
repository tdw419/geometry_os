; DESCRIPTION: Draws a black circle centered at (176, 165) with radius 30.
; PLAN: r0=176(x), r1=165(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 165
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
