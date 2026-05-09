; DESCRIPTION: Draws a purple circle centered at (308, 130) with radius 48.
; PLAN: r0=308(x), r1=130(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 130
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
