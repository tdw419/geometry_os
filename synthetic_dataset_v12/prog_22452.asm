; DESCRIPTION: Renders a white disk with center (402, 198) and radius 28.
; PLAN: r0=402(x), r1=198(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 198
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
