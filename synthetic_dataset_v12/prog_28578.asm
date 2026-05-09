; DESCRIPTION: Places a yellow circle of radius 71 at center (147, 139).
; PLAN: r0=147(x), r1=139(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 139
LDI r2, 71
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
