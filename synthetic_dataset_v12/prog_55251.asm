; DESCRIPTION: Places a black circle of radius 71 at center (403, 100).
; PLAN: r0=403(x), r1=100(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 100
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
