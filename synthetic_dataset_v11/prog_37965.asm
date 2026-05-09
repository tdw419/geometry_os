; DESCRIPTION: Creates a white circular shape at (222, 225) with radius 30.
; PLAN: r0=222(x), r1=225(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 225
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
