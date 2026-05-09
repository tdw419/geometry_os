; DESCRIPTION: Draws a blue circle centered at (113, 128) with radius 64.
; PLAN: r0=113(x), r1=128(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 128
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
