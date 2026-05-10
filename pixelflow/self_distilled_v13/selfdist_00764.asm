; DESCRIPTION: Draws a blue circle centered at (98, 48) with radius 76.
; PLAN: r0=98(x), r1=48(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 48
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
