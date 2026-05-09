; DESCRIPTION: Renders a white disk with center (463, 112) and radius 48.
; PLAN: r0=463(x), r1=112(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 463
LDI r1, 112
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
