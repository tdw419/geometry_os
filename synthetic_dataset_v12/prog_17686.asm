; DESCRIPTION: Draws a magenta circle centered at (59, 162) with radius 29.
; PLAN: r0=59(x), r1=162(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 162
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
