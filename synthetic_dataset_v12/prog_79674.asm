; DESCRIPTION: Creates a white circular shape at (167, 82) with radius 12.
; PLAN: r0=167(x), r1=82(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 82
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
