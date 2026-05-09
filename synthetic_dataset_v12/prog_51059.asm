; DESCRIPTION: Creates a green circular shape at (400, 58) with radius 45.
; PLAN: r0=400(x), r1=58(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 400
LDI r1, 58
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
