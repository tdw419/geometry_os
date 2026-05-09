; DESCRIPTION: Draws a magenta circle centered at (108, 130) with radius 36.
; PLAN: r0=108(x), r1=130(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 130
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
