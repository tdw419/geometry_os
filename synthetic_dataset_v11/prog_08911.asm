; DESCRIPTION: Creates a green circular shape at (115, 199) with radius 55.
; PLAN: r0=115(x), r1=199(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 199
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
