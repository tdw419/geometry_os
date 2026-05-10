; DESCRIPTION: Places a cyan circle of radius 25 at center (139, 89).
; PLAN: r0=139(x), r1=89(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 89
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
