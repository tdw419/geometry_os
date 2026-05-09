; DESCRIPTION: Draws a blue circle centered at (69, 143) with radius 62.
; PLAN: r0=69(x), r1=143(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 143
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
