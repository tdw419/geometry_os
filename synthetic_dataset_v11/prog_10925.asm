; DESCRIPTION: Creates a blue circular shape at (160, 69) with radius 53.
; PLAN: r0=160(x), r1=69(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 69
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
