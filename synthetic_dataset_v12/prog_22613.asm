; DESCRIPTION: Draws a black circle centered at (291, 140) with radius 22.
; PLAN: r0=291(x), r1=140(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 140
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
