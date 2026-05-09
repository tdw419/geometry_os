; DESCRIPTION: Draws a black circle centered at (96, 71) with radius 53.
; PLAN: r0=96(x), r1=71(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 71
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
