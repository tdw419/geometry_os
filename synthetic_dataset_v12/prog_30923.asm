; DESCRIPTION: Draws a black circle centered at (462, 200) with radius 37.
; PLAN: r0=462(x), r1=200(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 462
LDI r1, 200
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
