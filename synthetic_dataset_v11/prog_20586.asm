; DESCRIPTION: Renders a white disk with center (198, 155) and radius 46.
; PLAN: r0=198(x), r1=155(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 155
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
