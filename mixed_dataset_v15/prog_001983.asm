; DESCRIPTION: Composite: Draws a yellow line from (89, 9) to (318, 186) then Draws a cyan rectangle at (69, 39) with width 99 and height 87 then Draws a red circle centered at (147, 171) with radius 68.
; PLAN: r0=89(x1), r1=9(y1), r2=318(x2), r3=186(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=69(x), r6=39(y), r7=99(width), r8=87(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=147(x), r11=171(y), r12=68(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 89
LDI r1, 9
LDI r2, 318
LDI r3, 186
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 39
LDI r7, 99
LDI r8, 87
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 147
LDI r11, 171
LDI r12, 68
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
