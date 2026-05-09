; DESCRIPTION: Creates a blue circular shape at (82, 119) with radius 45.
; PLAN: r0=82(x), r1=119(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 119
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
