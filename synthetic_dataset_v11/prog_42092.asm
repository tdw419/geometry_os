; DESCRIPTION: Draws a black circle centered at (88, 114) with radius 61.
; PLAN: r0=88(x), r1=114(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 114
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
