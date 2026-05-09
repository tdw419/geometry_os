; DESCRIPTION: Renders a white disk with center (337, 21) and radius 12.
; PLAN: r0=337(x), r1=21(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 337
LDI r1, 21
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
