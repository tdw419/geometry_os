; DESCRIPTION: Composite: Draws a orange line from (325, 247) to (302, 18) then Sets a single orange pixel at (176, 143) then Creates a yellow rectangular region at (129, 65) spanning 96 by 90 pixels.
; PLAN: r0=325(x1), r1=247(y1), r2=302(x2), r3=18(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=176(x), r6=143(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=129(x), r11=65(y), r12=96(width), r13=90(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 325
LDI r1, 247
LDI r2, 302
LDI r3, 18
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 143
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 129
LDI r11, 65
LDI r12, 96
LDI r13, 90
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
