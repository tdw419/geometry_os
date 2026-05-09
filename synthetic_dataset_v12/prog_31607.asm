; DESCRIPTION: Composite: Sets a single cyan pixel at (483, 217) then Draws a purple rectangle at (45, 45) with width 81 and height 76.
; PLAN: r0=483(x), r1=217(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=45(x), r6=45(y), r7=81(width), r8=76(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 483
LDI r1, 217
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 45
LDI r6, 45
LDI r7, 81
LDI r8, 76
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
