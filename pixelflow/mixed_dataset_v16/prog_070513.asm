; DESCRIPTION: Creates a white circular shape at (292, 67) with radius 28.
; PLAN: r0=292(x), r1=67(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 67
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
