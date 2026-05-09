; DESCRIPTION: Composite: Draws a green line from (158, 176) to (173, 8) then Sets a single yellow pixel at (437, 248) then Creates a orange rectangular region at (136, 68) spanning 109 by 105 pixels.
; PLAN: r0=158(x1), r1=176(y1), r2=173(x2), r3=8(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=437(x), r6=248(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=136(x), r11=68(y), r12=109(width), r13=105(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 158
LDI r1, 176
LDI r2, 173
LDI r3, 8
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 437
LDI r6, 248
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 136
LDI r11, 68
LDI r12, 109
LDI r13, 105
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
