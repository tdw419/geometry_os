; DESCRIPTION: Draws a magenta circle centered at (318, 178) with radius 52.
; PLAN: r0=318(x), r1=178(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 318
LDI r1, 178
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
