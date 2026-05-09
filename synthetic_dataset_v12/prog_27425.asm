; DESCRIPTION: Creates a white circular shape at (312, 205) with radius 48.
; PLAN: r0=312(x), r1=205(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 205
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
