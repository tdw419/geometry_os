; DESCRIPTION: Places a cyan circle of radius 60 at center (258, 139).
; PLAN: r0=258(x), r1=139(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 258
LDI r1, 139
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
