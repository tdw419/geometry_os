; DESCRIPTION: Draws a magenta circle centered at (162, 137) with radius 32.
; PLAN: r0=162(x), r1=137(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 137
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
