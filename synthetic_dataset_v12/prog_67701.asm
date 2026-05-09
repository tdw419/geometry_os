; DESCRIPTION: Renders a white disk with center (205, 144) and radius 67.
; PLAN: r0=205(x), r1=144(y), r2=67(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 144
LDI r2, 67
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
