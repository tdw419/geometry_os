; DESCRIPTION: Draws a purple circle centered at (107, 73) with radius 32.
; PLAN: r0=107(x), r1=73(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 73
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
