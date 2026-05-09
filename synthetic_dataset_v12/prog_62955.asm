; DESCRIPTION: Composite: Places a purple 76x20 rectangle at position (297, 117) then Sets a single blue pixel at (252, 60) then Draws a orange line from (55, 165) to (451, 72).
; PLAN: r0=297(x), r1=117(y), r2=76(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=252(x), r6=60(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=55(x1), r11=165(y1), r12=451(x2), r13=72(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 297
LDI r1, 117
LDI r2, 76
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 252
LDI r6, 60
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 55
LDI r11, 165
LDI r12, 451
LDI r13, 72
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
