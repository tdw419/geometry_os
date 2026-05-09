; DESCRIPTION: Draws a magenta circle centered at (86, 128) with radius 24.
; PLAN: r0=86(x), r1=128(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 128
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
