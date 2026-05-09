; DESCRIPTION: Renders a green disk with center (109, 184) and radius 67.
; PLAN: r0=109(x), r1=184(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 184
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
