; DESCRIPTION: Creates a white circular shape at (192, 49) with radius 42.
; PLAN: r0=192(x), r1=49(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 49
LDI r2, 42
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
