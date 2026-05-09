; DESCRIPTION: Draws a blue circle centered at (436, 180) with radius 24.
; PLAN: r0=436(x), r1=180(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 436
LDI r1, 180
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
