; DESCRIPTION: Creates a white circular shape at (314, 151) with radius 77.
; PLAN: r0=314(x), r1=151(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 151
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
