; DESCRIPTION: Draws a black circle centered at (161, 101) with radius 61.
; PLAN: r0=161(x), r1=101(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 101
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
