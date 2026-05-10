; DESCRIPTION: Draws a black circle centered at (105, 121) with radius 65.
; PLAN: r0=105(x), r1=121(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 121
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
