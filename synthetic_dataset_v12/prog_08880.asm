; DESCRIPTION: Draws a blue circle centered at (433, 176) with radius 62.
; PLAN: r0=433(x), r1=176(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 176
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
