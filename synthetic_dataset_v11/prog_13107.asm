; DESCRIPTION: Renders a white disk with center (219, 132) and radius 11.
; PLAN: r0=219(x), r1=132(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 132
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
