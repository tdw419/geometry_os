; DESCRIPTION: Draws a black circle centered at (177, 56) with radius 56.
; PLAN: r0=177(x), r1=56(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 56
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
