; DESCRIPTION: Creates a green circular shape at (55, 142) with radius 14.
; PLAN: r0=55(x), r1=142(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 142
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
