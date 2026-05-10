; DESCRIPTION: Composite: Sets a single blue pixel at (395, 46) then Draws a purple rectangle at (381, 155) with width 101 and height 25.
; PLAN: r0=395(x), r1=46(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=381(x), r6=155(y), r7=101(width), r8=25(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 395
LDI r1, 46
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 381
LDI r6, 155
LDI r7, 101
LDI r8, 25
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
