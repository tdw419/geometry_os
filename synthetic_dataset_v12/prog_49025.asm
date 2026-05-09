; DESCRIPTION: Renders a white disk with center (350, 171) and radius 33.
; PLAN: r0=350(x), r1=171(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 171
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
