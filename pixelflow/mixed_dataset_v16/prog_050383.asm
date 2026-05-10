; DESCRIPTION: Composite: Draws a yellow line from (306, 111) to (278, 252) then Places a orange dot at position (444, 245) then Creates a magenta rectangular region at (115, 158) spanning 98 by 45 pixels.
; PLAN: r0=306(x1), r1=111(y1), r2=278(x2), r3=252(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=444(x), r6=245(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=115(x), r11=158(y), r12=98(width), r13=45(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 306
LDI r1, 111
LDI r2, 278
LDI r3, 252
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 444
LDI r6, 245
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 115
LDI r11, 158
LDI r12, 98
LDI r13, 45
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
