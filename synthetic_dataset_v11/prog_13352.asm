; DESCRIPTION: Renders a white disk with center (36, 189) and radius 16.
; PLAN: r0=36(x), r1=189(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 36
LDI r1, 189
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
