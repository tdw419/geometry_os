; DESCRIPTION: Draws a magenta circle centered at (178, 74) with radius 50.
; PLAN: r0=178(x), r1=74(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 74
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
