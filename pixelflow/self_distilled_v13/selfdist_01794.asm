; DESCRIPTION: Draws a magenta circle centered at (148, 21) with radius 50.
; PLAN: r0=148(x), r1=21(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 21
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
