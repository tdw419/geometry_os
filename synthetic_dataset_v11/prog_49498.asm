; DESCRIPTION: Draws a magenta circle centered at (96, 213) with radius 10.
; PLAN: r0=96(x), r1=213(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 213
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
