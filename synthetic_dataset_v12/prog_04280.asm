; DESCRIPTION: Draws a magenta circle centered at (207, 178) with radius 20.
; PLAN: r0=207(x), r1=178(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 178
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
