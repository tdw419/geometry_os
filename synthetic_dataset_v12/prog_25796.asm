; DESCRIPTION: Creates a blue circular shape at (365, 92) with radius 35.
; PLAN: r0=365(x), r1=92(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 92
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
