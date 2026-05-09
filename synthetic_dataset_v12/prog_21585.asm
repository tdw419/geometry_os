; DESCRIPTION: Draws a black circle centered at (328, 78) with radius 73.
; PLAN: r0=328(x), r1=78(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 78
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
