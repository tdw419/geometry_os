; DESCRIPTION: Composite: Sets a single cyan pixel at (279, 187) then Places a cyan 91x68 rectangle at position (413, 183).
; PLAN: r0=279(x), r1=187(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=413(x), r6=183(y), r7=91(width), r8=68(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 279
LDI r1, 187
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 413
LDI r6, 183
LDI r7, 91
LDI r8, 68
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
