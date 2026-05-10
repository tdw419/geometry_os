; DESCRIPTION: Composite: Places a cyan dot at position (368, 85) then Places a white circle of radius 31 at center (52, 97).
; PLAN: r0=368(x), r1=85(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=52(x), r6=97(y), r7=31(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 368
LDI r1, 85
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 52
LDI r6, 97
LDI r7, 31
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
