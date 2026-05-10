; DESCRIPTION: Draws a magenta circle centered at (274, 73) with radius 27.
; PLAN: r0=274(x), r1=73(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 73
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
