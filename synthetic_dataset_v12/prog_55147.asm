; DESCRIPTION: Draws a magenta circle centered at (416, 159) with radius 62.
; PLAN: r0=416(x), r1=159(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 159
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
