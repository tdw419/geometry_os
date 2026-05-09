; DESCRIPTION: Draws a magenta circle centered at (422, 102) with radius 33.
; PLAN: r0=422(x), r1=102(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 102
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
