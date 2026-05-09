; DESCRIPTION: Draws a magenta circle centered at (175, 213) with radius 39.
; PLAN: r0=175(x), r1=213(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 213
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
