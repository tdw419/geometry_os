; DESCRIPTION: Draws a black circle centered at (396, 121) with radius 75.
; PLAN: r0=396(x), r1=121(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 121
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
