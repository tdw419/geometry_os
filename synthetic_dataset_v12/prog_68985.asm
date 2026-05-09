; DESCRIPTION: Composite: Sets a single white pixel at (134, 83) then Places a black 35x31 rectangle at position (233, 86).
; PLAN: r0=134(x), r1=83(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=233(x), r6=86(y), r7=35(width), r8=31(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 134
LDI r1, 83
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 233
LDI r6, 86
LDI r7, 35
LDI r8, 31
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
