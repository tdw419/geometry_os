; DESCRIPTION: Draws a magenta circle centered at (92, 87) with radius 48.
; PLAN: r0=92(x), r1=87(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 87
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
