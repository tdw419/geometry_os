; DESCRIPTION: Draws a magenta circle centered at (131, 93) with radius 65.
; PLAN: r0=131(x), r1=93(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 93
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
