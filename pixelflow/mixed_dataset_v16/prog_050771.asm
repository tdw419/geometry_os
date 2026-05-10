; DESCRIPTION: Composite: Sets a single black pixel at (268, 151) then Places a white circle of radius 67 at center (241, 72).
; PLAN: r0=268(x), r1=151(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=241(x), r6=72(y), r7=67(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 268
LDI r1, 151
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 241
LDI r6, 72
LDI r7, 67
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
