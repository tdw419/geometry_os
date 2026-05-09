; DESCRIPTION: Renders a white disk with center (233, 178) and radius 43.
; PLAN: r0=233(x), r1=178(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 233
LDI r1, 178
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
