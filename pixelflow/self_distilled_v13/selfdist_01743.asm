; DESCRIPTION: Draws a magenta circle centered at (271, 177) with radius 74.
; PLAN: r0=271(x), r1=177(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 271
LDI r1, 177
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
