; DESCRIPTION: Creates a blue circular shape at (285, 69) with radius 69.
; PLAN: r0=285(x), r1=69(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 69
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
