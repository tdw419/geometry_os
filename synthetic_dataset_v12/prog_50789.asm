; DESCRIPTION: Draws a black circle centered at (402, 126) with radius 47.
; PLAN: r0=402(x), r1=126(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 126
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
