; DESCRIPTION: Creates a blue circular shape at (376, 105) with radius 42.
; PLAN: r0=376(x), r1=105(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 105
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
