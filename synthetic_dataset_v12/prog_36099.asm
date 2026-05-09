; DESCRIPTION: Composite: Places a cyan circle of radius 53 at center (137, 184) then Sets a single cyan pixel at (3, 206).
; PLAN: r0=137(x), r1=184(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=3(x), r6=206(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 137
LDI r1, 184
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 3
LDI r6, 206
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
