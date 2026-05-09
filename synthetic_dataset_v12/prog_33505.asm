; DESCRIPTION: Composite: Places a red line segment connecting (496, 241) to (367, 185) then Places a blue dot at position (123, 110) then Draws a magenta rectangle at (347, 91) with width 116 and height 60.
; PLAN: r0=496(x1), r1=241(y1), r2=367(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=123(x), r6=110(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=347(x), r11=91(y), r12=116(width), r13=60(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 496
LDI r1, 241
LDI r2, 367
LDI r3, 185
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 110
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 347
LDI r11, 91
LDI r12, 116
LDI r13, 60
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
