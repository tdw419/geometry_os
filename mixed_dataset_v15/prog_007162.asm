; DESCRIPTION: Composite: Places a orange dot at position (85, 38) then Places a cyan 48x118 rectangle at position (405, 17).
; PLAN: r0=85(x), r1=38(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=405(x), r6=17(y), r7=48(width), r8=118(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 85
LDI r1, 38
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 405
LDI r6, 17
LDI r7, 48
LDI r8, 118
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
