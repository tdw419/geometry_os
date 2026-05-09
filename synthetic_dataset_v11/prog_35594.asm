; DESCRIPTION: Draws a magenta circle centered at (129, 117) with radius 20.
; PLAN: r0=129(x), r1=117(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 117
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
