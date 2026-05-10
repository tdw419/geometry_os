; DESCRIPTION: Renders a white circular shape at (311, 109) with radius 15.
; PLAN: r0=311(x), r1=109(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 109
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
