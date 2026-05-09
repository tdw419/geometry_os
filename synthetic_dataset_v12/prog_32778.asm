; DESCRIPTION: Creates a white circular shape at (186, 116) with radius 75.
; PLAN: r0=186(x), r1=116(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 116
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
