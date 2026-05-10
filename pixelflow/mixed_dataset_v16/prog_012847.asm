; DESCRIPTION: Places a cyan circle of radius 56 at center (67, 139).
; PLAN: r0=67(x), r1=139(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 139
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
