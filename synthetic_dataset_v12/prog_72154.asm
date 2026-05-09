; DESCRIPTION: Creates a green circular shape at (148, 152) with radius 78.
; PLAN: r0=148(x), r1=152(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 152
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
