; DESCRIPTION: Composite: Draws a red line from (87, 157) to (184, 172) then Places a yellow dot at position (152, 7) then Creates a red rectangular region at (37, 88) spanning 22 by 60 pixels.
; PLAN: r0=87(x1), r1=157(y1), r2=184(x2), r3=172(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=152(x), r6=7(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=37(x), r11=88(y), r12=22(width), r13=60(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 87
LDI r1, 157
LDI r2, 184
LDI r3, 172
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 7
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 37
LDI r11, 88
LDI r12, 22
LDI r13, 60
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
