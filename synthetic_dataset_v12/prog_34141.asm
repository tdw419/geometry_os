; DESCRIPTION: Renders a white disk with center (284, 86) and radius 51.
; PLAN: r0=284(x), r1=86(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 284
LDI r1, 86
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
