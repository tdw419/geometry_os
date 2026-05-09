; DESCRIPTION: Draws a magenta circle centered at (142, 214) with radius 25.
; PLAN: r0=142(x), r1=214(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 214
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
