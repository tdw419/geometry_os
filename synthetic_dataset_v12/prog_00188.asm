; DESCRIPTION: Draws a black circle centered at (37, 243) with radius 13.
; PLAN: r0=37(x), r1=243(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 37
LDI r1, 243
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
