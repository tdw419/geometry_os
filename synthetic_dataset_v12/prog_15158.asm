; DESCRIPTION: Draws a black circle centered at (26, 78) with radius 25.
; PLAN: r0=26(x), r1=78(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 26
LDI r1, 78
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
