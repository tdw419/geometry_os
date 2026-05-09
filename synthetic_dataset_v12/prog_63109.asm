; DESCRIPTION: Draws a magenta circle centered at (405, 130) with radius 25.
; PLAN: r0=405(x), r1=130(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 130
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
