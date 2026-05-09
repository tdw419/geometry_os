; DESCRIPTION: Draws a black circle centered at (475, 40) with radius 37.
; PLAN: r0=475(x), r1=40(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 475
LDI r1, 40
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
