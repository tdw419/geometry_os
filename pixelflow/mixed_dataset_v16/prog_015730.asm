; DESCRIPTION: Draws a magenta circle centered at (113, 171) with radius 68.
; PLAN: r0=113(x), r1=171(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 171
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
