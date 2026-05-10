; DESCRIPTION: Draws a black circle centered at (418, 95) with radius 26.
; PLAN: r0=418(x), r1=95(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 95
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
