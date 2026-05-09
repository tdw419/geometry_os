; DESCRIPTION: Composite: Places a cyan circle of radius 38 at center (61, 162) then Sets a single yellow pixel at (280, 139).
; PLAN: r0=61(x), r1=162(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=280(x), r6=139(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 61
LDI r1, 162
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 280
LDI r6, 139
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
