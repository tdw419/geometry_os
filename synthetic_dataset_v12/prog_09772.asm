; DESCRIPTION: Creates a red circular shape at (188, 128) with radius 67.
; PLAN: r0=188(x), r1=128(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 128
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
