; DESCRIPTION: Renders a white disk with center (118, 206) and radius 24.
; PLAN: r0=118(x), r1=206(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 206
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
