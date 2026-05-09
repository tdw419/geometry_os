; DESCRIPTION: Draws a magenta circle centered at (184, 203) with radius 51.
; PLAN: r0=184(x), r1=203(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 203
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
