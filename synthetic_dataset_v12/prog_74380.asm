; DESCRIPTION: Draws a black circle centered at (425, 174) with radius 73.
; PLAN: r0=425(x), r1=174(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 425
LDI r1, 174
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
