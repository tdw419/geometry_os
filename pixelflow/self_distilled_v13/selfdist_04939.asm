; DESCRIPTION: Renders a white circular shape at (274, 171) with radius 40.
; PLAN: r0=274(x), r1=171(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 171
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
