; DESCRIPTION: Draws a green circle centered at (418, 195) with radius 53.
; PLAN: r0=418(x), r1=195(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 195
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
