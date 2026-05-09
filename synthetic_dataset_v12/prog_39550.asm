; DESCRIPTION: Draws a magenta circle centered at (370, 95) with radius 12.
; PLAN: r0=370(x), r1=95(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 95
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
