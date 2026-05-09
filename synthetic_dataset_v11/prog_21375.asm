; DESCRIPTION: Draws a magenta circle centered at (99, 68) with radius 67.
; PLAN: r0=99(x), r1=68(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 68
LDI r2, 67
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
