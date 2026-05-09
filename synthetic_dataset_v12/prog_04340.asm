; DESCRIPTION: Composite: Sets a single yellow pixel at (230, 17) then Places a orange 37x102 rectangle at position (281, 47).
; PLAN: r0=230(x), r1=17(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=281(x), r6=47(y), r7=37(width), r8=102(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 230
LDI r1, 17
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 281
LDI r6, 47
LDI r7, 37
LDI r8, 102
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
