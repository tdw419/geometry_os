; DESCRIPTION: Renders a green disk with center (48, 148) and radius 15.
; PLAN: r0=48(x), r1=148(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 48
LDI r1, 148
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
