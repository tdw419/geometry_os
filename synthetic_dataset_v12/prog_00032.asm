; DESCRIPTION: Composite: Sets a single orange pixel at (492, 122) then Places a magenta 88x26 rectangle at position (60, 183).
; PLAN: r0=492(x), r1=122(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=60(x), r6=183(y), r7=88(width), r8=26(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 492
LDI r1, 122
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 60
LDI r6, 183
LDI r7, 88
LDI r8, 26
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
