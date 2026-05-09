; DESCRIPTION: Renders a white disk with center (160, 144) and radius 61.
; PLAN: r0=160(x), r1=144(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 144
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
