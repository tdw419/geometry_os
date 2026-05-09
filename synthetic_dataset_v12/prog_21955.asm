; DESCRIPTION: Draws a magenta circle centered at (468, 226) with radius 20.
; PLAN: r0=468(x), r1=226(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 468
LDI r1, 226
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
