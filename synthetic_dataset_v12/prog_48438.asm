; DESCRIPTION: Creates a blue circular shape at (375, 149) with radius 69.
; PLAN: r0=375(x), r1=149(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 149
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
