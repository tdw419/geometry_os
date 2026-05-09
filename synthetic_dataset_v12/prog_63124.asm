; DESCRIPTION: Composite: Sets a single cyan pixel at (87, 37) then Draws a red rectangle at (278, 99) with width 70 and height 94.
; PLAN: r0=87(x), r1=37(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=278(x), r6=99(y), r7=70(width), r8=94(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 87
LDI r1, 37
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 278
LDI r6, 99
LDI r7, 70
LDI r8, 94
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
