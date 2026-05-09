; DESCRIPTION: Draws a magenta circle centered at (209, 141) with radius 29.
; PLAN: r0=209(x), r1=141(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 141
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
