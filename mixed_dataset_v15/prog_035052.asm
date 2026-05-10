; DESCRIPTION: Draws a magenta circle centered at (425, 173) with radius 63.
; PLAN: r0=425(x), r1=173(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 425
LDI r1, 173
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
