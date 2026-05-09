; DESCRIPTION: Draws a magenta circle centered at (320, 95) with radius 10.
; PLAN: r0=320(x), r1=95(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 320
LDI r1, 95
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
