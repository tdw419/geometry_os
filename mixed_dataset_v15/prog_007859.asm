; DESCRIPTION: Renders a green disk with center (171, 92) and radius 34.
; PLAN: r0=171(x), r1=92(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 92
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
