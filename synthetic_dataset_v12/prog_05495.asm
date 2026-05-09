; DESCRIPTION: Draws a green circle centered at (195, 155) with radius 63.
; PLAN: r0=195(x), r1=155(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 155
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
