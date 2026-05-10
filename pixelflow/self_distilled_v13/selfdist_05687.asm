; DESCRIPTION: Draws a magenta circle centered at (379, 34) with radius 77.
; PLAN: r0=379(x), r1=34(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 379
LDI r1, 34
LDI r2, 77
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
