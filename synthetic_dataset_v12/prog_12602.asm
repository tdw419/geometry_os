; DESCRIPTION: Composite: Places a red dot at position (194, 145) then Places a cyan circle of radius 37 at center (390, 211).
; PLAN: r0=194(x), r1=145(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=390(x), r6=211(y), r7=37(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 194
LDI r1, 145
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 390
LDI r6, 211
LDI r7, 37
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
