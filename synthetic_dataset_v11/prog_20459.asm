; DESCRIPTION: Places a black circle of radius 65 at center (71, 73).
; PLAN: r0=71(x), r1=73(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 73
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
