; DESCRIPTION: Composite: Places a cyan circle of radius 67 at center (273, 157) then Sets a single yellow pixel at (158, 138).
; PLAN: r0=273(x), r1=157(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=158(x), r6=138(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 273
LDI r1, 157
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 158
LDI r6, 138
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
