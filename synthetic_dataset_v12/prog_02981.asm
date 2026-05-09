; DESCRIPTION: Draws a magenta circle centered at (309, 164) with radius 72.
; PLAN: r0=309(x), r1=164(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 164
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
