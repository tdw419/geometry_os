; DESCRIPTION: Renders a white disk with center (39, 66) and radius 36.
; PLAN: r0=39(x), r1=66(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 39
LDI r1, 66
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
