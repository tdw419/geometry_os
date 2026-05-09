; DESCRIPTION: Renders a black disk with center (403, 92) and radius 48.
; PLAN: r0=403(x), r1=92(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 92
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
