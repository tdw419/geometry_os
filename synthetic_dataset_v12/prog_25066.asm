; DESCRIPTION: Draws a magenta circle centered at (460, 81) with radius 52.
; PLAN: r0=460(x), r1=81(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 460
LDI r1, 81
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
