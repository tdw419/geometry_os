; DESCRIPTION: Draws a magenta circle centered at (103, 130) with radius 19.
; PLAN: r0=103(x), r1=130(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 130
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
