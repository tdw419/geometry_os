; DESCRIPTION: Composite: Creates a cyan circular shape at (177, 81) with radius 24 then Sets a single yellow pixel at (368, 66).
; PLAN: r0=177(x), r1=81(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=368(x), r6=66(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 177
LDI r1, 81
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 368
LDI r6, 66
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
