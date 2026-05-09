; DESCRIPTION: Creates a white circular shape at (211, 131) with radius 24.
; PLAN: r0=211(x), r1=131(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 131
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
