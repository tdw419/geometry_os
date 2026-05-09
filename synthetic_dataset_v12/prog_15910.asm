; DESCRIPTION: Draws a black circle centered at (424, 178) with radius 40.
; PLAN: r0=424(x), r1=178(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 178
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
