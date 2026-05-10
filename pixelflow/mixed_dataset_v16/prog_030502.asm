; DESCRIPTION: Renders a green circular shape at (303, 148) with radius 60.
; PLAN: r0=303(x), r1=148(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 148
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
