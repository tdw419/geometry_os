; DESCRIPTION: Composite: Sets a single yellow pixel at (267, 50) then Places a cyan 26x105 rectangle at position (83, 106).
; PLAN: r0=267(x), r1=50(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=83(x), r6=106(y), r7=26(width), r8=105(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 267
LDI r1, 50
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 83
LDI r6, 106
LDI r7, 26
LDI r8, 105
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
