; DESCRIPTION: Draws a magenta circle centered at (214, 114) with radius 53.
; PLAN: r0=214(x), r1=114(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 114
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
