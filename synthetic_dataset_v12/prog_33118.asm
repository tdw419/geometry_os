; DESCRIPTION: Draws a magenta circle centered at (131, 172) with radius 17.
; PLAN: r0=131(x), r1=172(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 172
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
