; DESCRIPTION: Draws a magenta circle centered at (161, 126) with radius 75.
; PLAN: r0=161(x), r1=126(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 126
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
