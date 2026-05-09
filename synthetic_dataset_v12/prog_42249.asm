; DESCRIPTION: Draws a magenta circle centered at (120, 116) with radius 64.
; PLAN: r0=120(x), r1=116(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 116
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
