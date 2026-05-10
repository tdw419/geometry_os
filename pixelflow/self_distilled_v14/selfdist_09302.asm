; DESCRIPTION: Renders a green circular shape at (136, 150) with radius 67.
; PLAN: r0=136(x), r1=150(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 150
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
