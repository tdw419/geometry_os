; DESCRIPTION: Renders a green disk with center (109, 134) and radius 72.
; PLAN: r0=109(x), r1=134(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 134
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
