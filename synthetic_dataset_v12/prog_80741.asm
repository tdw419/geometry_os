; DESCRIPTION: Composite: Places a cyan dot at position (45, 73) then Places a orange circle of radius 65 at center (405, 144).
; PLAN: r0=45(x), r1=73(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=405(x), r6=144(y), r7=65(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 45
LDI r1, 73
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 405
LDI r6, 144
LDI r7, 65
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
