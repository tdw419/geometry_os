; DESCRIPTION: Creates a white circular shape at (178, 85) with radius 55.
; PLAN: r0=178(x), r1=85(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 85
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
