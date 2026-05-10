; DESCRIPTION: Creates a white circular shape at (225, 69) with radius 55.
; PLAN: r0=225(x), r1=69(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 69
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
