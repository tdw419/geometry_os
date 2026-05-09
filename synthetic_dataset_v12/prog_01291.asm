; DESCRIPTION: Draws a magenta circle centered at (355, 130) with radius 73.
; PLAN: r0=355(x), r1=130(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 130
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
