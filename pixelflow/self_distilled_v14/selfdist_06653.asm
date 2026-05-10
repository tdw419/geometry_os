; DESCRIPTION: Draws a magenta circle centered at (28, 100) with radius 27.
; PLAN: r0=28(x), r1=100(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 28
LDI r1, 100
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
