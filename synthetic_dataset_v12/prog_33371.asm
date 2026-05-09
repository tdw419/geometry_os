; DESCRIPTION: Creates a white circular shape at (286, 112) with radius 37.
; PLAN: r0=286(x), r1=112(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 112
LDI r2, 37
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
