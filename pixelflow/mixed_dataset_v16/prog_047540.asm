; DESCRIPTION: Draws a blue circle centered at (442, 190) with radius 49.
; PLAN: r0=442(x), r1=190(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 442
LDI r1, 190
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
