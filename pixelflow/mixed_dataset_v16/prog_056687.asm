; DESCRIPTION: Draws a magenta circle centered at (309, 173) with radius 59.
; PLAN: r0=309(x), r1=173(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 173
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
