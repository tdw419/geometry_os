; DESCRIPTION: Renders a cyan disk with center (136, 148) and radius 28.
; PLAN: r0=136(x), r1=148(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 148
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
