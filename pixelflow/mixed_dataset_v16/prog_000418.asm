; DESCRIPTION: Draws a black circle centered at (451, 197) with radius 45.
; PLAN: r0=451(x), r1=197(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 451
LDI r1, 197
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
