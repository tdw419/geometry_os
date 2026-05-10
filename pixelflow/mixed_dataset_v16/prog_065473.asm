; DESCRIPTION: Draws a black circle centered at (142, 57) with radius 43.
; PLAN: r0=142(x), r1=57(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 57
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
