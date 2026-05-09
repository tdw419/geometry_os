; DESCRIPTION: Composite: Places a purple dot at position (230, 158) then Draws a black rectangle at (344, 170) with width 120 and height 14.
; PLAN: r0=230(x), r1=158(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=344(x), r6=170(y), r7=120(width), r8=14(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 230
LDI r1, 158
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 344
LDI r6, 170
LDI r7, 120
LDI r8, 14
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
