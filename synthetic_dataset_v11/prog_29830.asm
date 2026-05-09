; DESCRIPTION: Draws a black circle centered at (85, 32) with radius 25.
; PLAN: r0=85(x), r1=32(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 32
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
