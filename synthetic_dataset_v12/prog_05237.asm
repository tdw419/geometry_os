; DESCRIPTION: Composite: Places a cyan dot at position (99, 251) then Places a orange circle of radius 46 at center (381, 179).
; PLAN: r0=99(x), r1=251(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=381(x), r6=179(y), r7=46(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 99
LDI r1, 251
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 381
LDI r6, 179
LDI r7, 46
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
