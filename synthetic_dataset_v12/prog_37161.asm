; DESCRIPTION: Draws a black circle centered at (354, 200) with radius 12.
; PLAN: r0=354(x), r1=200(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 354
LDI r1, 200
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
