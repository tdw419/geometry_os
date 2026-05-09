; DESCRIPTION: Composite: Sets a single black pixel at (430, 217) then Draws a magenta rectangle at (204, 22) with width 63 and height 13.
; PLAN: r0=430(x), r1=217(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=204(x), r6=22(y), r7=63(width), r8=13(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 430
LDI r1, 217
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 204
LDI r6, 22
LDI r7, 63
LDI r8, 13
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
