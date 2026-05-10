; DESCRIPTION: Draws a magenta circle centered at (197, 45) with radius 64.
; PLAN: r0=197(x), r1=45(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 45
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
