; DESCRIPTION: Creates a white circular shape at (169, 196) with radius 48.
; PLAN: r0=169(x), r1=196(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 196
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
