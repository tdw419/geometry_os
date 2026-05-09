; DESCRIPTION: Draws a black circle centered at (140, 202) with radius 18.
; PLAN: r0=140(x), r1=202(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 202
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
