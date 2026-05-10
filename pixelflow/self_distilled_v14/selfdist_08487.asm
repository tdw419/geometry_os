; DESCRIPTION: Draws a magenta circle centered at (126, 105) with radius 71.
; PLAN: r0=126(x), r1=105(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 105
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
