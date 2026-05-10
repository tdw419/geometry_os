; DESCRIPTION: Places a white disk with center (374, 92) and radius 71.
; PLAN: r0=374(x), r1=92(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 92
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
