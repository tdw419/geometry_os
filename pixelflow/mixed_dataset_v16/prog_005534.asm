; DESCRIPTION: Composite: Places a orange dot at position (378, 128) then Places a magenta 81x26 rectangle at position (49, 64).
; PLAN: r0=378(x), r1=128(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=49(x), r6=64(y), r7=81(width), r8=26(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 378
LDI r1, 128
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 49
LDI r6, 64
LDI r7, 81
LDI r8, 26
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
