; DESCRIPTION: Draws a black circle centered at (426, 27) with radius 15.
; PLAN: r0=426(x), r1=27(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 426
LDI r1, 27
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
