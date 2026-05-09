; DESCRIPTION: Places a black circle of radius 66 at center (108, 139).
; PLAN: r0=108(x), r1=139(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 139
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
