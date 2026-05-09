; DESCRIPTION: Draws a magenta circle centered at (120, 218) with radius 17.
; PLAN: r0=120(x), r1=218(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 218
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
