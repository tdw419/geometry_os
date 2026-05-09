; DESCRIPTION: Draws a blue circle centered at (405, 121) with radius 69.
; PLAN: r0=405(x), r1=121(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 121
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
