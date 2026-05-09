; DESCRIPTION: Draws a black circle centered at (233, 138) with radius 55.
; PLAN: r0=233(x), r1=138(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 233
LDI r1, 138
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
