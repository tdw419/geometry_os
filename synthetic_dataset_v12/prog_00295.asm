; DESCRIPTION: Composite: Places a purple dot at position (319, 118) then Draws a orange rectangle at (98, 42) with width 95 and height 105.
; PLAN: r0=319(x), r1=118(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=98(x), r6=42(y), r7=95(width), r8=105(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 319
LDI r1, 118
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 98
LDI r6, 42
LDI r7, 95
LDI r8, 105
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
