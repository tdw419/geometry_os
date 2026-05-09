; DESCRIPTION: Creates a white circular shape at (193, 69) with radius 23.
; PLAN: r0=193(x), r1=69(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 69
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
