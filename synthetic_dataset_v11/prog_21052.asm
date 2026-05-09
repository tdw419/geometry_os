; DESCRIPTION: Renders a white disk with center (220, 40) and radius 29.
; PLAN: r0=220(x), r1=40(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 40
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
