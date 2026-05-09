; DESCRIPTION: Draws a blue circle centered at (72, 39) with radius 32.
; PLAN: r0=72(x), r1=39(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 39
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
