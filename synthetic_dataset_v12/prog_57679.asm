; DESCRIPTION: Composite: Sets a single green pixel at (361, 101) then Places a yellow 58x107 rectangle at position (430, 56).
; PLAN: r0=361(x), r1=101(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=430(x), r6=56(y), r7=58(width), r8=107(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 361
LDI r1, 101
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 430
LDI r6, 56
LDI r7, 58
LDI r8, 107
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
