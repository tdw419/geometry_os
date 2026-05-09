; DESCRIPTION: Draws a magenta circle centered at (64, 48) with radius 19.
; PLAN: r0=64(x), r1=48(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 48
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
