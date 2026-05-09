; DESCRIPTION: Composite: Sets a single black pixel at (490, 11) then Draws a orange rectangle at (218, 191) with width 98 and height 11.
; PLAN: r0=490(x), r1=11(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=218(x), r6=191(y), r7=98(width), r8=11(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 490
LDI r1, 11
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 218
LDI r6, 191
LDI r7, 98
LDI r8, 11
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
