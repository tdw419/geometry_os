; DESCRIPTION: Composite: Sets a single white pixel at (462, 12) then Places a cyan circle of radius 42 at center (324, 86).
; PLAN: r0=462(x), r1=12(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=324(x), r6=86(y), r7=42(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 462
LDI r1, 12
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 324
LDI r6, 86
LDI r7, 42
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
