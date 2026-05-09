; DESCRIPTION: Draws a magenta circle centered at (161, 215) with radius 32.
; PLAN: r0=161(x), r1=215(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 215
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
