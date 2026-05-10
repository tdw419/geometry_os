; DESCRIPTION: Draws a blue circle centered at (337, 76) with radius 64.
; PLAN: r0=337(x), r1=76(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 337
LDI r1, 76
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
