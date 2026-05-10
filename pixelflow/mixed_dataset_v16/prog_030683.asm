; DESCRIPTION: Draws a black circle centered at (382, 37) with radius 25.
; PLAN: r0=382(x), r1=37(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 37
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
