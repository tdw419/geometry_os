; DESCRIPTION: Draws a black circle centered at (119, 60) with radius 40.
; PLAN: r0=119(x), r1=60(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 60
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
