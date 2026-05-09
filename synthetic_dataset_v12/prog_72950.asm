; DESCRIPTION: Draws a magenta circle centered at (276, 67) with radius 25.
; PLAN: r0=276(x), r1=67(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 67
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
