; DESCRIPTION: Creates a white circular shape at (234, 101) with radius 12.
; PLAN: r0=234(x), r1=101(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 101
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
