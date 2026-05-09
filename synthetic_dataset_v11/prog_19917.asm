; DESCRIPTION: Creates a green circular shape at (148, 166) with radius 55.
; PLAN: r0=148(x), r1=166(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 166
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
