; DESCRIPTION: Places a cyan circle of radius 72 at center (101, 139).
; PLAN: r0=101(x), r1=139(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 139
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
