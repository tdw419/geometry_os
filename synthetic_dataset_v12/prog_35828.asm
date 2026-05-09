; DESCRIPTION: Draws a purple circle centered at (394, 144) with radius 29.
; PLAN: r0=394(x), r1=144(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 144
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
