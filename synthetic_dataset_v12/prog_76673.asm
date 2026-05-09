; DESCRIPTION: Draws a magenta circle centered at (450, 118) with radius 52.
; PLAN: r0=450(x), r1=118(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 450
LDI r1, 118
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
