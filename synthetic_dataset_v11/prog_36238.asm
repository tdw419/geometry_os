; DESCRIPTION: Draws a blue circle centered at (82, 69) with radius 47.
; PLAN: r0=82(x), r1=69(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 69
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
