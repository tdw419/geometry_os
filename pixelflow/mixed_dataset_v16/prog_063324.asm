; DESCRIPTION: Draws a purple circle centered at (440, 86) with radius 32.
; PLAN: r0=440(x), r1=86(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 440
LDI r1, 86
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
