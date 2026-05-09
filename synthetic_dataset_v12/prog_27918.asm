; DESCRIPTION: Creates a green circular shape at (303, 134) with radius 45.
; PLAN: r0=303(x), r1=134(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 134
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
