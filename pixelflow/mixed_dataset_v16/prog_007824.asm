; DESCRIPTION: Draws a magenta circle centered at (64, 25) with radius 71.
; PLAN: r0=64(x), r1=25(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 25
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
