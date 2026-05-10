; DESCRIPTION: Draws a magenta circle centered at (394, 123) with radius 72.
; PLAN: r0=394(x), r1=123(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 123
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
