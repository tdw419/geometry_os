; DESCRIPTION: Draws a magenta circle centered at (195, 175) with radius 71.
; PLAN: r0=195(x), r1=175(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 175
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
