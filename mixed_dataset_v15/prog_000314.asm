; DESCRIPTION: Draws a blue circle centered at (482, 102) with radius 28.
; PLAN: r0=482(x), r1=102(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 482
LDI r1, 102
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
