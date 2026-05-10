; DESCRIPTION: Renders a cyan disk with center (136, 92) and radius 73.
; PLAN: r0=136(x), r1=92(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 92
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
