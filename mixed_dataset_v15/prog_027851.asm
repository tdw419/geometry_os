; DESCRIPTION: Draws a black circle centered at (241, 122) with radius 29.
; PLAN: r0=241(x), r1=122(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 122
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
