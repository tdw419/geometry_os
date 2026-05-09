; DESCRIPTION: Renders a white disk with center (373, 175) and radius 29.
; PLAN: r0=373(x), r1=175(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 175
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
