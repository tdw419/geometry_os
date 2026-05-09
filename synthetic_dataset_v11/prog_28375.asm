; DESCRIPTION: Draws a blue circle centered at (65, 60) with radius 28.
; PLAN: r0=65(x), r1=60(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 60
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
