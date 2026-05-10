; DESCRIPTION: Composite: Places a white dot at position (156, 156) then Places a cyan circle of radius 44 at center (335, 199).
; PLAN: r0=156(x), r1=156(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=335(x), r6=199(y), r7=44(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 156
LDI r1, 156
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 335
LDI r6, 199
LDI r7, 44
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
