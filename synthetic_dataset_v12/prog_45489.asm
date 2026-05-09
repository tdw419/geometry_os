; DESCRIPTION: Draws a black circle centered at (104, 95) with radius 32.
; PLAN: r0=104(x), r1=95(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 95
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
