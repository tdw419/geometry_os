; DESCRIPTION: Draws a magenta circle centered at (44, 97) with radius 19.
; PLAN: r0=44(x), r1=97(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 97
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
