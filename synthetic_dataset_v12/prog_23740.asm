; DESCRIPTION: Renders a white disk with center (385, 17) and radius 13.
; PLAN: r0=385(x), r1=17(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 17
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
