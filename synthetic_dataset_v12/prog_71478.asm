; DESCRIPTION: Composite: Sets a single black pixel at (46, 62) then Draws a red rectangle at (226, 170) with width 97 and height 57.
; PLAN: r0=46(x), r1=62(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=226(x), r6=170(y), r7=97(width), r8=57(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 46
LDI r1, 62
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 226
LDI r6, 170
LDI r7, 97
LDI r8, 57
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
