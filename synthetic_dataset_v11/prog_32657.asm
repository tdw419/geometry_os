; DESCRIPTION: Draws a magenta circle centered at (117, 244) with radius 12.
; PLAN: r0=117(x), r1=244(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 244
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
