; DESCRIPTION: Draws a magenta circle centered at (257, 195) with radius 29.
; PLAN: r0=257(x), r1=195(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 257
LDI r1, 195
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
