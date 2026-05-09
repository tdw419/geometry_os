; DESCRIPTION: Draws a black circle centered at (100, 203) with radius 38.
; PLAN: r0=100(x), r1=203(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 203
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
