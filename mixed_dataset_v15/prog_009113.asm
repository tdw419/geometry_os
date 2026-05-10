; DESCRIPTION: Renders a white circular shape at (104, 148) with radius 19.
; PLAN: r0=104(x), r1=148(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 148
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
