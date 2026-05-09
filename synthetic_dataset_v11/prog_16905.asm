; DESCRIPTION: Draws a black circle centered at (223, 85) with radius 33.
; PLAN: r0=223(x), r1=85(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 85
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
