; DESCRIPTION: Draws a black circle centered at (130, 60) with radius 44.
; PLAN: r0=130(x), r1=60(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 60
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
