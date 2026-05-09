; DESCRIPTION: Creates a red circular shape at (67, 96) with radius 65.
; PLAN: r0=67(x), r1=96(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 96
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
