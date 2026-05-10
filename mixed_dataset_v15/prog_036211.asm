; DESCRIPTION: Creates a white circular shape at (176, 172) with radius 16.
; PLAN: r0=176(x), r1=172(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 172
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
