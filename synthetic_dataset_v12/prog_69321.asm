; DESCRIPTION: Draws a black circle centered at (405, 86) with radius 22.
; PLAN: r0=405(x), r1=86(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 86
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
