; DESCRIPTION: Renders a blue disk with center (166, 163) and radius 14.
; PLAN: r0=166(x), r1=163(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 163
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
