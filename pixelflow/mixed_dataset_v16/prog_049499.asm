; DESCRIPTION: Creates a white circular shape at (206, 131) with radius 30.
; PLAN: r0=206(x), r1=131(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 131
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
