; DESCRIPTION: Creates a white circular shape at (158, 206) with radius 32.
; PLAN: r0=158(x), r1=206(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 206
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
