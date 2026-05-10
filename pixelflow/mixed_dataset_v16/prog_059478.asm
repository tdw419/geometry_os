; DESCRIPTION: Renders a white disk with center (371, 214) and radius 38.
; PLAN: r0=371(x), r1=214(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 214
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
