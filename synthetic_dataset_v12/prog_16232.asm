; DESCRIPTION: Draws a magenta circle centered at (123, 177) with radius 68.
; PLAN: r0=123(x), r1=177(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 177
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
