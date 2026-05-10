; DESCRIPTION: Renders a white disk with center (240, 75) and radius 55.
; PLAN: r0=240(x), r1=75(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 240
LDI r1, 75
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
