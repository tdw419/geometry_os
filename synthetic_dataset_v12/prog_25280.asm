; DESCRIPTION: Places a cyan circle of radius 17 at center (123, 139).
; PLAN: r0=123(x), r1=139(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 139
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
