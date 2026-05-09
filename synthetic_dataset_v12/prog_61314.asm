; DESCRIPTION: Creates a white circular shape at (73, 174) with radius 40.
; PLAN: r0=73(x), r1=174(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 174
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
