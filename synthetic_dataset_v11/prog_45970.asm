; DESCRIPTION: Draws a magenta circle centered at (173, 123) with radius 40.
; PLAN: r0=173(x), r1=123(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 123
LDI r2, 40
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
