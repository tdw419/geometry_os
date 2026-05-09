; DESCRIPTION: Creates a white circular shape at (322, 205) with radius 34.
; PLAN: r0=322(x), r1=205(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 322
LDI r1, 205
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
