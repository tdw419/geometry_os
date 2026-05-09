; DESCRIPTION: Draws a black circle centered at (225, 166) with radius 35.
; PLAN: r0=225(x), r1=166(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 166
LDI r2, 35
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
