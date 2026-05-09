; DESCRIPTION: Draws a magenta circle centered at (105, 77) with radius 13.
; PLAN: r0=105(x), r1=77(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 77
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
