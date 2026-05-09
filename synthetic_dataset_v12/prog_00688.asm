; DESCRIPTION: Draws a magenta circle centered at (229, 125) with radius 59.
; PLAN: r0=229(x), r1=125(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 125
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
