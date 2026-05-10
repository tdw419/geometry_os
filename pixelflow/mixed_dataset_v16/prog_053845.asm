; DESCRIPTION: Creates a white circular shape at (325, 153) with radius 67.
; PLAN: r0=325(x), r1=153(y), r2=67(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 153
LDI r2, 67
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
