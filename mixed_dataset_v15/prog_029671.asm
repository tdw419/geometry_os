; DESCRIPTION: Creates a blue circular shape at (413, 82) with radius 15.
; PLAN: r0=413(x), r1=82(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 82
LDI r2, 15
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
