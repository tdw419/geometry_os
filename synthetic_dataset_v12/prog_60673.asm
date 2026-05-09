; DESCRIPTION: Draws a magenta circle centered at (344, 72) with radius 39.
; PLAN: r0=344(x), r1=72(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 72
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
