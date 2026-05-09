; DESCRIPTION: Creates a white circular shape at (184, 107) with radius 67.
; PLAN: r0=184(x), r1=107(y), r2=67(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 107
LDI r2, 67
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
