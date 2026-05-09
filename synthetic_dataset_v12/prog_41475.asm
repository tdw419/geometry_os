; DESCRIPTION: Draws a magenta circle centered at (396, 178) with radius 30.
; PLAN: r0=396(x), r1=178(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 178
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
