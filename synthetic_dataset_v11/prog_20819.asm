; DESCRIPTION: Draws a magenta circle centered at (217, 160) with radius 38.
; PLAN: r0=217(x), r1=160(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 160
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
