; DESCRIPTION: Draws a purple circle centered at (87, 210) with radius 24.
; PLAN: r0=87(x), r1=210(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 210
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
