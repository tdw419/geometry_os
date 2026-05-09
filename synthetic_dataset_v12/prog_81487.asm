; DESCRIPTION: Draws a black circle centered at (325, 177) with radius 72.
; PLAN: r0=325(x), r1=177(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 177
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
