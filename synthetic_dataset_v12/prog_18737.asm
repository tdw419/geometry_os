; DESCRIPTION: Draws a white circle centered at (257, 78) with radius 20.
; PLAN: r0=257(x), r1=78(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 257
LDI r1, 78
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
