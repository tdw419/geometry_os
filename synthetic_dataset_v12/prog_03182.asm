; DESCRIPTION: Composite: Draws a orange rectangle at (126, 101) with width 104 and height 114 then Draws a magenta line from (73, 205) to (116, 71) then Sets a single cyan pixel at (47, 104).
; PLAN: r0=126(x), r1=101(y), r2=104(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=73(x1), r6=205(y1), r7=116(x2), r8=71(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=47(x), r11=104(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 126
LDI r1, 101
LDI r2, 104
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 205
LDI r7, 116
LDI r8, 71
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 47
LDI r11, 104
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
