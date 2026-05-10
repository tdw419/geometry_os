; DESCRIPTION: Draws a magenta circle centered at (173, 33) with radius 18.
; PLAN: r0=173(x), r1=33(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 33
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
