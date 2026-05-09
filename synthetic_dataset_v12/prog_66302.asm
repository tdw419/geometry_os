; DESCRIPTION: Creates a white circular shape at (206, 182) with radius 57.
; PLAN: r0=206(x), r1=182(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 182
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
