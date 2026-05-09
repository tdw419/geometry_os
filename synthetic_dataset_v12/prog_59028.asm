; DESCRIPTION: Renders a green disk with center (274, 53) and radius 48.
; PLAN: r0=274(x), r1=53(y), r2=48(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 53
LDI r2, 48
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
