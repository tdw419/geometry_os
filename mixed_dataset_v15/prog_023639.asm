; DESCRIPTION: Composite: Sets a single yellow pixel at (93, 97) then Places a green 61x14 rectangle at position (68, 7).
; PLAN: r0=93(x), r1=97(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=68(x), r6=7(y), r7=61(width), r8=14(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 93
LDI r1, 97
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 68
LDI r6, 7
LDI r7, 61
LDI r8, 14
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
