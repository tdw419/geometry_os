; DESCRIPTION: Composite: Sets a single cyan pixel at (364, 18) then Draws a green rectangle at (205, 50) with width 103 and height 109.
; PLAN: r0=364(x), r1=18(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=205(x), r6=50(y), r7=103(width), r8=109(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 364
LDI r1, 18
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 205
LDI r6, 50
LDI r7, 103
LDI r8, 109
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
