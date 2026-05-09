; DESCRIPTION: Creates a white circular shape at (185, 182) with radius 68.
; PLAN: r0=185(x), r1=182(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 182
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
