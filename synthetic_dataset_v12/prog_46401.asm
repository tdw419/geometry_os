; DESCRIPTION: Draws a magenta circle centered at (223, 24) with radius 21.
; PLAN: r0=223(x), r1=24(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 24
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
