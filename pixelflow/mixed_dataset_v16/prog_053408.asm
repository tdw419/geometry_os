; DESCRIPTION: Composite: Sets a single cyan pixel at (68, 2) then Places a blue 94x87 rectangle at position (190, 102).
; PLAN: r0=68(x), r1=2(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=190(x), r6=102(y), r7=94(width), r8=87(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 68
LDI r1, 2
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 190
LDI r6, 102
LDI r7, 94
LDI r8, 87
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
