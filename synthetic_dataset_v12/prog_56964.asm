; DESCRIPTION: Renders a white disk with center (76, 208) and radius 48.
; PLAN: r0=76(x), r1=208(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 208
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
