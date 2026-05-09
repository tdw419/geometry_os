; DESCRIPTION: Renders a white disk with center (344, 164) and radius 33.
; PLAN: r0=344(x), r1=164(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 164
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
