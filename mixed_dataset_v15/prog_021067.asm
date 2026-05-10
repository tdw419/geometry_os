; DESCRIPTION: Draws a black circle centered at (343, 150) with radius 56.
; PLAN: r0=343(x), r1=150(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 343
LDI r1, 150
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
