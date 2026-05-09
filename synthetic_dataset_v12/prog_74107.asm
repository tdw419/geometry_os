; DESCRIPTION: Draws a magenta circle centered at (279, 136) with radius 51.
; PLAN: r0=279(x), r1=136(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 136
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
