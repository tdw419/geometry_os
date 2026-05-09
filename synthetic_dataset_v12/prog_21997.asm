; DESCRIPTION: Creates a green circular shape at (104, 142) with radius 63.
; PLAN: r0=104(x), r1=142(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 142
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
