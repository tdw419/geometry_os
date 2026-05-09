; DESCRIPTION: Renders a red disk with center (289, 73) and radius 23.
; PLAN: r0=289(x), r1=73(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 289
LDI r1, 73
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
