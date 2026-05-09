; DESCRIPTION: Composite: Sets a single blue pixel at (424, 42) then Draws a blue rectangle at (363, 99) with width 49 and height 58.
; PLAN: r0=424(x), r1=42(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=363(x), r6=99(y), r7=49(width), r8=58(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 424
LDI r1, 42
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 363
LDI r6, 99
LDI r7, 49
LDI r8, 58
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
