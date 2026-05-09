; DESCRIPTION: Places a cyan circle of radius 73 at center (83, 163).
; PLAN: r0=83(x), r1=163(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 163
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
