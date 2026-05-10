; DESCRIPTION: Draws a magenta circle centered at (42, 114) with radius 36.
; PLAN: r0=42(x), r1=114(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 114
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
