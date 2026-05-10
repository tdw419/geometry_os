; DESCRIPTION: Creates a white circular shape at (269, 190) with radius 13.
; PLAN: r0=269(x), r1=190(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 269
LDI r1, 190
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
