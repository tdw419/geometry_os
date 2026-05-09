; DESCRIPTION: Places a yellow circle of radius 29 at center (71, 82).
; PLAN: r0=71(x), r1=82(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 82
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
