; DESCRIPTION: Draws a magenta circle centered at (81, 171) with radius 44.
; PLAN: r0=81(x), r1=171(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 171
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
