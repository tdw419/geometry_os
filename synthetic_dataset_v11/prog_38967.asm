; DESCRIPTION: Creates a white circular shape at (74, 190) with radius 61.
; PLAN: r0=74(x), r1=190(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 190
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
