; DESCRIPTION: Composite: Places a green line segment connecting (38, 58) to (270, 32) then Sets a single black pixel at (318, 194) then Draws a blue rectangle at (98, 149) with width 108 and height 23.
; PLAN: r0=38(x1), r1=58(y1), r2=270(x2), r3=32(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=318(x), r6=194(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=98(x), r11=149(y), r12=108(width), r13=23(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 38
LDI r1, 58
LDI r2, 270
LDI r3, 32
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 194
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 98
LDI r11, 149
LDI r12, 108
LDI r13, 23
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
