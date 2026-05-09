; DESCRIPTION: Draws a magenta circle centered at (98, 117) with radius 17.
; PLAN: r0=98(x), r1=117(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 117
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
