; DESCRIPTION: Creates a green circular shape at (37, 142) with radius 32.
; PLAN: r0=37(x), r1=142(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 37
LDI r1, 142
LDI r2, 32
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
