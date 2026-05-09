; DESCRIPTION: Draws a black circle centered at (355, 240) with radius 10.
; PLAN: r0=355(x), r1=240(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 240
LDI r2, 10
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
