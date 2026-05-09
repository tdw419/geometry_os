; DESCRIPTION: Composite: Sets a single purple pixel at (314, 165) then Draws a cyan rectangle at (365, 99) with width 85 and height 114.
; PLAN: r0=314(x), r1=165(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=365(x), r6=99(y), r7=85(width), r8=114(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 314
LDI r1, 165
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 365
LDI r6, 99
LDI r7, 85
LDI r8, 114
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
