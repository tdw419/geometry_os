; DESCRIPTION: Renders a white circular shape at (349, 136) with radius 43.
; PLAN: r0=349(x), r1=136(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 136
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
