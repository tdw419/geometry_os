; DESCRIPTION: Draws a magenta circle centered at (83, 145) with radius 61.
; PLAN: r0=83(x), r1=145(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 145
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
