; DESCRIPTION: Creates a blue circular shape at (184, 79) with radius 67.
; PLAN: r0=184(x), r1=79(y), r2=67(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 79
LDI r2, 67
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
