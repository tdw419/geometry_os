; DESCRIPTION: Draws a magenta circle centered at (294, 150) with radius 75.
; PLAN: r0=294(x), r1=150(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 150
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
