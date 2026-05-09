; DESCRIPTION: Draws a black circle centered at (200, 200) with radius 40.
; PLAN: r0=200(x), r1=200(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 200
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
