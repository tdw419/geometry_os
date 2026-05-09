; DESCRIPTION: Draws a black circle centered at (178, 117) with radius 62.
; PLAN: r0=178(x), r1=117(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 117
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
