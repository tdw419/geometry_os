; DESCRIPTION: Creates a blue circular shape at (118, 76) with radius 72.
; PLAN: r0=118(x), r1=76(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 76
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
