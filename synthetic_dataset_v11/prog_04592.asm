; DESCRIPTION: Draws a black circle centered at (165, 141) with radius 36.
; PLAN: r0=165(x), r1=141(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 141
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
