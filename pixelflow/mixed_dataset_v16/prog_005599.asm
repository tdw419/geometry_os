; DESCRIPTION: Composite: Sets a single purple pixel at (483, 13) then Draws a green rectangle at (338, 150) with width 89 and height 55.
; PLAN: r0=483(x), r1=13(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=338(x), r6=150(y), r7=89(width), r8=55(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 483
LDI r1, 13
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 338
LDI r6, 150
LDI r7, 89
LDI r8, 55
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
