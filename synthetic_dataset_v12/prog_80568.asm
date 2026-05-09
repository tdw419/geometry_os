; DESCRIPTION: Composite: Sets a single green pixel at (469, 255) then Places a white 11x42 rectangle at position (361, 72).
; PLAN: r0=469(x), r1=255(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=361(x), r6=72(y), r7=11(width), r8=42(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 469
LDI r1, 255
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 361
LDI r6, 72
LDI r7, 11
LDI r8, 42
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
