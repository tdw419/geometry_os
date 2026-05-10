; DESCRIPTION: Draws a blue circle centered at (299, 79) with radius 32.
; PLAN: r0=299(x), r1=79(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 299
LDI r1, 79
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
