; DESCRIPTION: Draws a magenta circle centered at (167, 159) with radius 60.
; PLAN: r0=167(x), r1=159(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 159
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
