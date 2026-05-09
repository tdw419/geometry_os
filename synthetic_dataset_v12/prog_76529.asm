; DESCRIPTION: Creates a white circular shape at (43, 144) with radius 37.
; PLAN: r0=43(x), r1=144(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 43
LDI r1, 144
LDI r2, 37
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
