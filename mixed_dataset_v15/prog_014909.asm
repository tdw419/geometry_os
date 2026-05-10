; DESCRIPTION: Composite: Places a purple line segment connecting (490, 185) to (477, 155) then Draws a orange rectangle at (126, 176) with width 36 and height 35 then Sets a single purple pixel at (140, 192).
; PLAN: r0=490(x1), r1=185(y1), r2=477(x2), r3=155(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=176(y), r7=36(width), r8=35(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=140(x), r11=192(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 490
LDI r1, 185
LDI r2, 477
LDI r3, 155
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 176
LDI r7, 36
LDI r8, 35
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 140
LDI r11, 192
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
