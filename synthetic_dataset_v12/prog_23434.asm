; DESCRIPTION: Creates a white circular shape at (455, 76) with radius 10.
; PLAN: r0=455(x), r1=76(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 455
LDI r1, 76
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
