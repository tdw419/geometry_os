; DESCRIPTION: Draws a black circle centered at (362, 183) with radius 63.
; PLAN: r0=362(x), r1=183(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 183
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
