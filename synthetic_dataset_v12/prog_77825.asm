; DESCRIPTION: Renders a white disk with center (387, 81) and radius 39.
; PLAN: r0=387(x), r1=81(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 81
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
