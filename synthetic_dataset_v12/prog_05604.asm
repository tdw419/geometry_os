; DESCRIPTION: Draws a magenta circle centered at (159, 130) with radius 62.
; PLAN: r0=159(x), r1=130(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 130
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
