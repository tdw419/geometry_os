; DESCRIPTION: Draws a magenta circle centered at (215, 23) with radius 23.
; PLAN: r0=215(x), r1=23(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 23
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
