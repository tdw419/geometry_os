; DESCRIPTION: Draws a magenta circle centered at (135, 204) with radius 32.
; PLAN: r0=135(x), r1=204(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 204
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
