; DESCRIPTION: Draws a black circle centered at (24, 216) with radius 12.
; PLAN: r0=24(x), r1=216(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 24
LDI r1, 216
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
