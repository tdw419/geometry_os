; DESCRIPTION: Composite: Draws a black line from (490, 233) to (286, 15) then Draws a magenta rectangle at (413, 64) with width 24 and height 46 then Sets a single purple pixel at (336, 245).
; PLAN: r0=490(x1), r1=233(y1), r2=286(x2), r3=15(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=413(x), r6=64(y), r7=24(width), r8=46(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=336(x), r11=245(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 490
LDI r1, 233
LDI r2, 286
LDI r3, 15
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 64
LDI r7, 24
LDI r8, 46
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 336
LDI r11, 245
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
