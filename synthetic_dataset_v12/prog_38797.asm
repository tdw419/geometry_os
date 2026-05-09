; DESCRIPTION: Creates a white circular shape at (152, 225) with radius 24.
; PLAN: r0=152(x), r1=225(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 225
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
