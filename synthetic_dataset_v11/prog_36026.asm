; DESCRIPTION: Creates a green circular shape at (164, 142) with radius 31.
; PLAN: r0=164(x), r1=142(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 142
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
