; DESCRIPTION: Renders a green disk with center (341, 116) and radius 53.
; PLAN: r0=341(x), r1=116(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 116
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
