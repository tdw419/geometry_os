; DESCRIPTION: Draws a magenta circle centered at (134, 221) with radius 31.
; PLAN: r0=134(x), r1=221(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 221
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
