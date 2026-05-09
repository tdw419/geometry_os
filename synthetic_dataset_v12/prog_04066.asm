; DESCRIPTION: Creates a green circular shape at (341, 103) with radius 35.
; PLAN: r0=341(x), r1=103(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 103
LDI r2, 35
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
