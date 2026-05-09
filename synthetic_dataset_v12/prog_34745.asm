; DESCRIPTION: Composite: Places a orange dot at position (175, 29) then Draws a cyan rectangle at (207, 26) with width 49 and height 38.
; PLAN: r0=175(x), r1=29(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=207(x), r6=26(y), r7=49(width), r8=38(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 175
LDI r1, 29
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 207
LDI r6, 26
LDI r7, 49
LDI r8, 38
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
