; DESCRIPTION: Draws a black circle centered at (177, 158) with radius 17.
; PLAN: r0=177(x), r1=158(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 158
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
