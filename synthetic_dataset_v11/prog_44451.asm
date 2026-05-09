; DESCRIPTION: Renders a white disk with center (173, 105) and radius 31.
; PLAN: r0=173(x), r1=105(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 105
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
