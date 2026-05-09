; DESCRIPTION: Creates a white circular shape at (30, 209) with radius 11.
; PLAN: r0=30(x), r1=209(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 30
LDI r1, 209
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
