; DESCRIPTION: Renders a white disk with center (459, 181) and radius 13.
; PLAN: r0=459(x), r1=181(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 459
LDI r1, 181
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
