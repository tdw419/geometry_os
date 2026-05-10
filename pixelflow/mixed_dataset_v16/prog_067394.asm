; DESCRIPTION: Draws a magenta circle centered at (59, 209) with radius 22.
; PLAN: r0=59(x), r1=209(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 209
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
