; DESCRIPTION: Draws a black circle centered at (155, 103) with radius 52.
; PLAN: r0=155(x), r1=103(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 103
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
