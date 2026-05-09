; DESCRIPTION: Places a black circle of radius 29 at center (190, 71).
; PLAN: r0=190(x), r1=71(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 71
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
