; DESCRIPTION: Renders a green disk with center (336, 139) and radius 51.
; PLAN: r0=336(x), r1=139(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 336
LDI r1, 139
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
