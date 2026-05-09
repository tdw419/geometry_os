; DESCRIPTION: Draws a magenta circle centered at (154, 87) with radius 43.
; PLAN: r0=154(x), r1=87(y), r2=43(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 87
LDI r2, 43
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
