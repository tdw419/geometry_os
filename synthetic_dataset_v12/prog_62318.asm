; DESCRIPTION: Composite: Places a green dot at position (335, 75) then Draws a cyan rectangle at (276, 185) with width 97 and height 16.
; PLAN: r0=335(x), r1=75(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=276(x), r6=185(y), r7=97(width), r8=16(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 335
LDI r1, 75
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 276
LDI r6, 185
LDI r7, 97
LDI r8, 16
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
