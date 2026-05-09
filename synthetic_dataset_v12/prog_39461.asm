; DESCRIPTION: Composite: Places a orange line segment connecting (93, 255) to (75, 239) then Sets a single orange pixel at (164, 155) then Draws a cyan rectangle at (390, 69) with width 107 and height 106.
; PLAN: r0=93(x1), r1=255(y1), r2=75(x2), r3=239(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=164(x), r6=155(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=390(x), r11=69(y), r12=107(width), r13=106(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 93
LDI r1, 255
LDI r2, 75
LDI r3, 239
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 155
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 390
LDI r11, 69
LDI r12, 107
LDI r13, 106
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
