; DESCRIPTION: Creates a white circular shape at (241, 182) with radius 13.
; PLAN: r0=241(x), r1=182(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 182
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
