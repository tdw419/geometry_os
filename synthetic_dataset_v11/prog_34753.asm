; DESCRIPTION: Draws a black circle centered at (89, 100) with radius 56.
; PLAN: r0=89(x), r1=100(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 100
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
