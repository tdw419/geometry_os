; DESCRIPTION: Composite: Places a yellow dot at position (316, 207) then Draws a magenta rectangle at (214, 6) with width 98 and height 110.
; PLAN: r0=316(x), r1=207(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=214(x), r6=6(y), r7=98(width), r8=110(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 316
LDI r1, 207
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 214
LDI r6, 6
LDI r7, 98
LDI r8, 110
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
