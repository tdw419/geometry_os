; DESCRIPTION: Draws a black circle centered at (169, 114) with radius 53.
; PLAN: r0=169(x), r1=114(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 114
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
