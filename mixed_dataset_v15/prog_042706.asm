; DESCRIPTION: Draws a magenta circle centered at (310, 219) with radius 29.
; PLAN: r0=310(x), r1=219(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 310
LDI r1, 219
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
