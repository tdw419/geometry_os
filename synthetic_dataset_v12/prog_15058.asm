; DESCRIPTION: Composite: Draws a blue line from (318, 140) to (232, 188) then Places a white dot at position (359, 192) then Creates a magenta rectangular region at (400, 91) spanning 33 by 54 pixels.
; PLAN: r0=318(x1), r1=140(y1), r2=232(x2), r3=188(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=359(x), r6=192(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=400(x), r11=91(y), r12=33(width), r13=54(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 318
LDI r1, 140
LDI r2, 232
LDI r3, 188
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 192
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 400
LDI r11, 91
LDI r12, 33
LDI r13, 54
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
