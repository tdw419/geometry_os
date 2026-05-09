; DESCRIPTION: Renders a white disk with center (313, 79) and radius 44.
; PLAN: r0=313(x), r1=79(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 79
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
