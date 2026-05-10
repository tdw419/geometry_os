; DESCRIPTION: Composite: Places a green line segment connecting (266, 235) to (408, 233) then Draws a cyan rectangle at (111, 77) with width 84 and height 15 then Sets a single purple pixel at (158, 151).
; PLAN: r0=266(x1), r1=235(y1), r2=408(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=111(x), r6=77(y), r7=84(width), r8=15(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=158(x), r11=151(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 266
LDI r1, 235
LDI r2, 408
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 111
LDI r6, 77
LDI r7, 84
LDI r8, 15
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 158
LDI r11, 151
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
