; DESCRIPTION: Creates a red circular shape at (120, 157) with radius 30.
; PLAN: r0=120(x), r1=157(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 157
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
