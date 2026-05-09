; DESCRIPTION: Composite: Sets a single cyan pixel at (203, 145) then Draws a magenta rectangle at (165, 30) with width 23 and height 41.
; PLAN: r0=203(x), r1=145(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=165(x), r6=30(y), r7=23(width), r8=41(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 203
LDI r1, 145
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 165
LDI r6, 30
LDI r7, 23
LDI r8, 41
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
