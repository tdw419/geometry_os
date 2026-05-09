; DESCRIPTION: Draws a magenta circle centered at (469, 144) with radius 16.
; PLAN: r0=469(x), r1=144(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 469
LDI r1, 144
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
