; DESCRIPTION: Places a cyan circle of radius 53 at center (419, 189).
; PLAN: r0=419(x), r1=189(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 189
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
