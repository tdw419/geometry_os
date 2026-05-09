; DESCRIPTION: Creates a red circular shape at (128, 196) with radius 14.
; PLAN: r0=128(x), r1=196(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 196
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
