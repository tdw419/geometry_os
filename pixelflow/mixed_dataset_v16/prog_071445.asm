; DESCRIPTION: Draws a blue circle centered at (32, 32) with radius 32.
; PLAN: r0=32(x), r1=32(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 32
LDI r1, 32
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
