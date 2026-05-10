; DESCRIPTION: Composite: Draws a cyan line from (54, 160) to (477, 165) then Places a red 86x101 rectangle at position (319, 107) then Places a green dot at position (343, 137).
; PLAN: r0=54(x1), r1=160(y1), r2=477(x2), r3=165(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=319(x), r6=107(y), r7=86(width), r8=101(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=343(x), r11=137(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 54
LDI r1, 160
LDI r2, 477
LDI r3, 165
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 107
LDI r7, 86
LDI r8, 101
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 343
LDI r11, 137
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
