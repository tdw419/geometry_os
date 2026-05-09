; DESCRIPTION: Composite: Draws a green line from (157, 53) to (188, 155) then Sets a single green pixel at (332, 137) then Draws a green rectangle at (166, 125) with width 76 and height 25.
; PLAN: r0=157(x1), r1=53(y1), r2=188(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=332(x), r6=137(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=166(x), r11=125(y), r12=76(width), r13=25(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 157
LDI r1, 53
LDI r2, 188
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 137
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 166
LDI r11, 125
LDI r12, 76
LDI r13, 25
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
