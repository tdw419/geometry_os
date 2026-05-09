; DESCRIPTION: Composite: Creates a cyan circular shape at (270, 121) with radius 78 then Sets a single white pixel at (139, 57).
; PLAN: r0=270(x), r1=121(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=139(x), r6=57(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 270
LDI r1, 121
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 139
LDI r6, 57
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
