; DESCRIPTION: Draws a magenta circle centered at (220, 71) with radius 32.
; PLAN: r0=220(x), r1=71(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 71
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
