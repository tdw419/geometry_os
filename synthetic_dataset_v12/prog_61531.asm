; DESCRIPTION: Composite: Sets a single white pixel at (439, 19) then Places a green circle of radius 23 at center (280, 37).
; PLAN: r0=439(x), r1=19(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=280(x), r6=37(y), r7=23(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 439
LDI r1, 19
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 280
LDI r6, 37
LDI r7, 23
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
