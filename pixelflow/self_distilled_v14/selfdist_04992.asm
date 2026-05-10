; DESCRIPTION: Draws a magenta circle centered at (175, 45) with radius 42.
; PLAN: r0=175(x), r1=45(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 45
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
