; DESCRIPTION: Composite: Sets a single cyan pixel at (102, 172) then Places a white circle of radius 58 at center (238, 166).
; PLAN: r0=102(x), r1=172(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=238(x), r6=166(y), r7=58(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 102
LDI r1, 172
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 238
LDI r6, 166
LDI r7, 58
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
