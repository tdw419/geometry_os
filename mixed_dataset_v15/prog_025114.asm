; DESCRIPTION: Composite: Sets a single yellow pixel at (486, 79) then Draws a red line from (294, 44) to (319, 97) then Draws a green rectangle at (139, 39) with width 91 and height 32.
; PLAN: r0=486(x), r1=79(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=294(x1), r6=44(y1), r7=319(x2), r8=97(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=139(x), r11=39(y), r12=91(width), r13=32(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 486
LDI r1, 79
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 294
LDI r6, 44
LDI r7, 319
LDI r8, 97
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 139
LDI r11, 39
LDI r12, 91
LDI r13, 32
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
