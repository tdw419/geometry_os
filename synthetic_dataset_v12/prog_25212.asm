; DESCRIPTION: Renders a white disk with center (167, 140) and radius 36.
; PLAN: r0=167(x), r1=140(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 140
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
