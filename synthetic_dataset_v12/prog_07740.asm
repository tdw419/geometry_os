; DESCRIPTION: Creates a white circular shape at (50, 167) with radius 45.
; PLAN: r0=50(x), r1=167(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 167
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
