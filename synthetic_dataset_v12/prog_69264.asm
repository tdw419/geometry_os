; DESCRIPTION: Places a cyan circle of radius 76 at center (376, 109).
; PLAN: r0=376(x), r1=109(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 109
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
