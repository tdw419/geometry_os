; DESCRIPTION: Draws a magenta circle centered at (174, 221) with radius 32.
; PLAN: r0=174(x), r1=221(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 221
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
