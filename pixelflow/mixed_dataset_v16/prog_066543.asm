; DESCRIPTION: Composite: Places a orange line segment connecting (472, 225) to (272, 167) then Places a red dot at position (465, 154) then Draws a green rectangle at (356, 174) with width 107 and height 58.
; PLAN: r0=472(x1), r1=225(y1), r2=272(x2), r3=167(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=465(x), r6=154(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=356(x), r11=174(y), r12=107(width), r13=58(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 472
LDI r1, 225
LDI r2, 272
LDI r3, 167
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 465
LDI r6, 154
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 356
LDI r11, 174
LDI r12, 107
LDI r13, 58
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
