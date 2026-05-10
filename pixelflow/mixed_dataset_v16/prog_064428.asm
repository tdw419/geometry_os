; DESCRIPTION: Draws a black circle centered at (102, 94) with radius 69.
; PLAN: r0=102(x), r1=94(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 94
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
