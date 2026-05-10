; DESCRIPTION: Places a black circle of radius 79 at center (184, 139).
; PLAN: r0=184(x), r1=139(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 139
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
