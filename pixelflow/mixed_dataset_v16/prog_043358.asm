; DESCRIPTION: Creates a white circular shape at (177, 104) with radius 77.
; PLAN: r0=177(x), r1=104(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 104
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
