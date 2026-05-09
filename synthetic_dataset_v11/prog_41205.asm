; DESCRIPTION: Draws a magenta circle centered at (91, 175) with radius 67.
; PLAN: r0=91(x), r1=175(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 175
LDI r2, 67
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
