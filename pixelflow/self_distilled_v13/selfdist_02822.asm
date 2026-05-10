; DESCRIPTION: Draws a magenta circle centered at (379, 190) with radius 31.
; PLAN: r0=379(x), r1=190(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 379
LDI r1, 190
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
