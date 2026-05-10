; DESCRIPTION: Composite: Sets a single green pixel at (199, 211) then Draws a purple rectangle at (2, 5) with width 90 and height 118.
; PLAN: r0=199(x), r1=211(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=2(x), r6=5(y), r7=90(width), r8=118(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 199
LDI r1, 211
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 2
LDI r6, 5
LDI r7, 90
LDI r8, 118
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
