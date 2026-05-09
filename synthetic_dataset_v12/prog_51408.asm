; DESCRIPTION: Draws a magenta circle centered at (354, 151) with radius 57.
; PLAN: r0=354(x), r1=151(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 354
LDI r1, 151
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
