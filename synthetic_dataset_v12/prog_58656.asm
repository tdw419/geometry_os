; DESCRIPTION: Creates a blue circular shape at (477, 79) with radius 13.
; PLAN: r0=477(x), r1=79(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 477
LDI r1, 79
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
