; DESCRIPTION: Draws a magenta circle centered at (343, 164) with radius 63.
; PLAN: r0=343(x), r1=164(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 343
LDI r1, 164
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
