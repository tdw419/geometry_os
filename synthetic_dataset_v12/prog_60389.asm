; DESCRIPTION: Draws a black circle centered at (346, 189) with radius 10.
; PLAN: r0=346(x), r1=189(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 189
LDI r2, 10
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
