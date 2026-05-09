; DESCRIPTION: Composite: Places a red circle of radius 24 at center (461, 73) then Sets a single cyan pixel at (487, 62).
; PLAN: r0=461(x), r1=73(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=487(x), r6=62(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 461
LDI r1, 73
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 487
LDI r6, 62
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
