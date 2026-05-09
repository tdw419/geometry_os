; DESCRIPTION: Composite: Sets a single white pixel at (268, 105) then Places a green circle of radius 16 at center (185, 156).
; PLAN: r0=268(x), r1=105(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=185(x), r6=156(y), r7=16(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 268
LDI r1, 105
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 185
LDI r6, 156
LDI r7, 16
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
