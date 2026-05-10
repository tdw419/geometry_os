; DESCRIPTION: Creates a white circular shape at (322, 162) with radius 36.
; PLAN: r0=322(x), r1=162(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 322
LDI r1, 162
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
