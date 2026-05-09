; DESCRIPTION: Composite: Places a yellow dot at position (378, 160) then Draws a cyan rectangle at (144, 41) with width 49 and height 58 then Draws a orange line from (290, 87) to (186, 53).
; PLAN: r0=378(x), r1=160(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=144(x), r6=41(y), r7=49(width), r8=58(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=290(x1), r11=87(y1), r12=186(x2), r13=53(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 378
LDI r1, 160
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 144
LDI r6, 41
LDI r7, 49
LDI r8, 58
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 290
LDI r11, 87
LDI r12, 186
LDI r13, 53
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
