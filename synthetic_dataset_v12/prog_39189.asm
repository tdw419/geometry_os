; DESCRIPTION: Renders a white disk with center (262, 106) and radius 57.
; PLAN: r0=262(x), r1=106(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 106
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
