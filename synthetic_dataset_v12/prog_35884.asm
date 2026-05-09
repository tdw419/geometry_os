; DESCRIPTION: Draws a magenta circle centered at (244, 203) with radius 48.
; PLAN: r0=244(x), r1=203(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 203
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
