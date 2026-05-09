; DESCRIPTION: Renders a green disk with center (264, 72) and radius 45.
; PLAN: r0=264(x), r1=72(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 72
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
