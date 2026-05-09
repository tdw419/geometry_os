; DESCRIPTION: Creates a white circular shape at (194, 229) with radius 10.
; PLAN: r0=194(x), r1=229(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 229
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
