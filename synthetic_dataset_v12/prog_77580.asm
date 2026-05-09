; DESCRIPTION: Draws a magenta circle centered at (310, 237) with radius 16.
; PLAN: r0=310(x), r1=237(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 310
LDI r1, 237
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
