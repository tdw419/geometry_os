; DESCRIPTION: Composite: Sets a single cyan pixel at (431, 123) then Draws a cyan rectangle at (355, 132) with width 87 and height 69.
; PLAN: r0=431(x), r1=123(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=355(x), r6=132(y), r7=87(width), r8=69(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 431
LDI r1, 123
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 355
LDI r6, 132
LDI r7, 87
LDI r8, 69
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
