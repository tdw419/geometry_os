; DESCRIPTION: Draws a purple circle centered at (192, 42) with radius 30.
; PLAN: r0=192(x), r1=42(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 42
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
