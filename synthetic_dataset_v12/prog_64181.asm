; DESCRIPTION: Renders a green disk with center (67, 109) and radius 66.
; PLAN: r0=67(x), r1=109(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 109
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
